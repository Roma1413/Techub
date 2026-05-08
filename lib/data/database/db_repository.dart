import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'techhub_db.dart';
import '../../models/models.dart';

class DbRepository {
  late TechHubDatabase _db;
  late StoreDao _storeDao;
  late ProductDao _productDao;
  late CartDao _cartDao;
  late OrderDao _orderDao;
  late SearchHistoryDao _searchHistoryDao;

  Future<void> init() async {
    _db = TechHubDatabase();
    _storeDao = _db.storeDao;
    _productDao = _db.productDao;
    _cartDao = _db.cartDao;
    _orderDao = _db.orderDao;
    _searchHistoryDao = _db.searchHistoryDao;

    final existing = await _storeDao.findAllStores();
    if (existing.isEmpty) {
      await _seedFromJson();
    }
  }

  void close() => _db.close();

  // ── SEED ─────────────────────────────────────────────
  Future<void> _seedFromJson() async {
    final jsonString = await rootBundle.loadString('assets/stores.json');
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    final stores = (jsonMap['stores'] as List)
        .map((s) => TechStore.fromJson(s as Map<String, dynamic>))
        .toList();

    for (final store in stores) {
      await _storeDao.insertStore(DbStoreCompanion.insert(
        id: store.id,
        name: store.name,
        address: store.address,
        imageUrl: store.imageUrl,
        rating: store.rating,
        category: store.category,
        deliveryTime: store.deliveryTime,
        deliveryFee: store.deliveryFee,
        attributes: store.attributes,
      ));

      for (final product in store.products) {
        await _productDao.insertProduct(DbProductCompanion.insert(
          id: product.id,
          storeId: store.id,
          name: product.name,
          description: product.description,
          price: product.price,
          originalPrice: product.originalPrice,
          imageUrl: product.imageUrl,
          rating: product.rating,
          reviewCount: product.reviewCount,
          inStock: Value(product.inStock),
          badge: Value(product.badge),
          bookmarked: Value(false),
        ));

        await _productDao.deleteSpecsForProduct(product.id);
        for (final spec in product.specs) {
          await _productDao.insertSpec(DbProductSpecCompanion.insert(
            productId: product.id,
            key: spec.key,
            value: spec.value,
          ));
        }
      }
    }
  }

  // ── STORES ───────────────────────────────────────────
  Future<List<TechStore>> getAllStores() async {
    final dbStores = await _storeDao.findAllStores();
    final stores = <TechStore>[];
    for (final s in dbStores) {
      final dbProducts = await _productDao.findProductsByStore(s.id);
      final products = <Product>[];
      for (final p in dbProducts) {
        final specs = await _productDao.findSpecsForProduct(p.id);
        products.add(_dbToProduct(p, specs));
      }
      stores.add(_dbToStore(s, products));
    }
    return stores;
  }

  // ── BOOKMARKS ────────────────────────────────────────
  Future<List<Product>> getBookmarkedProducts() async {
    final dbProducts = await _productDao.findBookmarked();
    final products = <Product>[];
    for (final p in dbProducts) {
      final specs = await _productDao.findSpecsForProduct(p.id);
      products.add(_dbToProduct(p, specs));
    }
    return products;
  }

  Stream<List<DbProductData>> watchBookmarked() =>
      _productDao.watchBookmarked();

  Future<void> toggleBookmark(String productId, bool bookmarked) =>
      _productDao.toggleBookmark(productId, bookmarked);

  // ── CART ─────────────────────────────────────────────
  Future<List<CartItem>> getCartItems() async {
    final items = await _cartDao.findAllCartItems();
    return items.map(_dbToCartItem).toList();
  }

  Stream<List<DbCartItemData>> watchCartItems() =>
      _cartDao.watchCartItems();

  Future<void> insertCartItem(CartItem item) =>
      _cartDao.insertCartItem(DbCartItemCompanion.insert(
        id: item.id,
        productId: item.productId,
        name: item.name,
        price: item.price,
        quantity: item.quantity,
        imageUrl: item.imageUrl,
      ));

  Future<void> deleteCartItem(String id) => _cartDao.deleteCartItem(id);

  Future<void> clearCart() => _cartDao.clearCart();

  // ── ORDERS ───────────────────────────────────────────
  Stream<List<DbOrderData>> watchOrders() => _orderDao.watchAllOrders();

  Future<void> insertOrder(Order order) async {
    final id = await _orderDao.insertOrder(
      DbOrderCompanion.insert(
        contactName: order.contactName,
        address: order.address,
        deliveryType: order.getFormattedSegment(),
        scheduledDate: order.selectedDate?.toIso8601String() ?? '',
        scheduledTime: order.getFormattedTime(),
        totalCost: order.totalCost,
      ),
    );

    for (final item in order.items) {
      await _orderDao.insertOrderItem(
        DbOrderItemCompanion.insert(
          orderId: id,
          productId: item.productId,
          name: item.name,
          price: item.price,
          quantity: item.quantity,
          imageUrl: item.imageUrl,
        ),
      );
    }
  } // ← this was the misplaced } that was closing the class early

  // ── SEARCH HISTORY ───────────────────────────────────
  Future<List<String>> getSearchHistory() async {
    final rows = await _searchHistoryDao.findAll();
    return rows.map((r) => r.query).toList();
  }

  Stream<List<DbSearchHistoryData>> watchSearchHistory() =>
      _searchHistoryDao.watchAll();

  Future<void> addSearchQuery(String query) =>
      _searchHistoryDao.insert(query);

  Future<void> removeSearchQuery(String query) =>
      _searchHistoryDao.deleteQuery(query);

  Future<void> clearSearchHistory() => _searchHistoryDao.clearAll();

  // ── CONVERTERS ───────────────────────────────────────
  TechStore _dbToStore(DbStoreData s, List<Product> products) => TechStore(
    id: s.id,
    name: s.name,
    address: s.address,
    imageUrl: s.imageUrl,
    rating: s.rating,
    category: s.category,
    deliveryTime: s.deliveryTime,
    deliveryFee: s.deliveryFee,
    attributes: s.attributes,
    products: products,
  );

  Product _dbToProduct(
      DbProductData p, List<DbProductSpecData> specs) =>
      Product(
        id: p.id,
        name: p.name,
        description: p.description,
        price: p.price,
        originalPrice: p.originalPrice,
        imageUrl: p.imageUrl,
        rating: p.rating,
        reviewCount: p.reviewCount,
        inStock: p.inStock,
        badge: p.badge,
        bookmarked: p.bookmarked,
        specs: specs.map((s) => ProductSpec(s.key, s.value)).toList(),
      );

  CartItem _dbToCartItem(DbCartItemData i) => CartItem(
    id: i.id,
    productId: i.productId,
    name: i.name,
    price: i.price,
    quantity: i.quantity,
    imageUrl: i.imageUrl,
  );
} // ← this is the real class closing brace