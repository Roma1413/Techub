import 'package:drift/drift.dart';
import 'connection.dart' as impl;

part 'techhub_db.g.dart';

// ─── TABLES ──────────────────────────────────────────────

class DbStore extends Table {
  TextColumn get id          => text()();
  TextColumn get name        => text()();
  TextColumn get address     => text()();
  TextColumn get imageUrl    => text()();
  RealColumn get rating      => real()();
  TextColumn get category    => text()();
  TextColumn get deliveryTime => text()();
  RealColumn get deliveryFee => real()();
  TextColumn get attributes  => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class DbProduct extends Table {
  TextColumn get id            => text()();
  TextColumn get storeId       => text().references(DbStore, #id)();
  TextColumn get name          => text()();
  TextColumn get description   => text()();
  RealColumn get price         => real()();
  RealColumn get originalPrice => real()();
  TextColumn get imageUrl      => text()();
  RealColumn get rating        => real()();
  IntColumn  get reviewCount   => integer()();
  BoolColumn get inStock       => boolean().withDefault(const Constant(true))();
  TextColumn get badge         => text().withDefault(const Constant(''))();
  BoolColumn get bookmarked    => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DbProductSpec extends Table {
  IntColumn  get id        => integer().autoIncrement()();
  TextColumn get productId => text().references(DbProduct, #id)();
  TextColumn get key       => text()();
  TextColumn get value     => text()();
}

class DbCartItem extends Table {
  TextColumn get id        => text()();
  TextColumn get productId => text()();
  TextColumn get name      => text()();
  RealColumn get price     => real()();
  IntColumn  get quantity  => integer()();
  TextColumn get imageUrl  => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class DbOrder extends Table {
  IntColumn  get id           => integer().autoIncrement()();
  TextColumn get contactName  => text()();
  TextColumn get address      => text()();
  TextColumn get deliveryType => text()(); // 'Delivery' or 'Store Pickup'
  TextColumn get scheduledDate => text()(); // ISO date string
  TextColumn get scheduledTime => text()(); // 'HH:mm'
  RealColumn get totalCost    => real()();
}

class DbOrderItem extends Table {
  IntColumn  get id        => integer().autoIncrement()();
  IntColumn  get orderId   => integer().references(DbOrder, #id)();
  TextColumn get productId => text()();
  TextColumn get name      => text()();
  RealColumn get price     => real()();
  IntColumn  get quantity  => integer()();
  TextColumn get imageUrl  => text()();
}

class DbSearchHistory extends Table {
  IntColumn    get id         => integer().autoIncrement()();
  TextColumn   get query      => text()();
  DateTimeColumn get searchedAt => dateTime()();
}

// ─── DATABASE ────────────────────────────────────────────

@DriftDatabase(
  tables: [
    DbStore,
    DbProduct,
    DbProductSpec,
    DbCartItem,
    DbOrder,
    DbOrderItem,
    DbSearchHistory,
  ],
  daos: [
    StoreDao,
    ProductDao,
    CartDao,
    OrderDao,
    SearchHistoryDao,
  ],
)
class TechHubDatabase extends _$TechHubDatabase {
  TechHubDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;
}

// ─── STORE DAO ───────────────────────────────────────────

@DriftAccessor(tables: [DbStore, DbProduct])
class StoreDao extends DatabaseAccessor<TechHubDatabase>
    with _$StoreDaoMixin {
  StoreDao(super.db);

  Future<List<DbStoreData>> findAllStores() =>
      select(dbStore).get();

  Stream<List<DbStoreData>> watchAllStores() =>
      select(dbStore).watch();

  Future<int> insertStore(Insertable<DbStoreData> store) =>
      into(dbStore).insertOnConflictUpdate(store);

  Future deleteStore(String id) =>
      (delete(dbStore)..where((t) => t.id.equals(id))).go();
}

// ─── PRODUCT DAO ─────────────────────────────────────────

@DriftAccessor(tables: [DbProduct, DbProductSpec])
class ProductDao extends DatabaseAccessor<TechHubDatabase>
    with _$ProductDaoMixin {
  ProductDao(super.db);

  Future<List<DbProductData>> findProductsByStore(String storeId) =>
      (select(dbProduct)..where((t) => t.storeId.equals(storeId))).get();

  Future<List<DbProductData>> findBookmarked() =>
      (select(dbProduct)..where((t) => t.bookmarked.equals(true))).get();

  Stream<List<DbProductData>> watchBookmarked() =>
      (select(dbProduct)..where((t) => t.bookmarked.equals(true))).watch();

  Future<List<DbProductSpecData>> findSpecsForProduct(String productId) =>
      (select(dbProductSpec)
        ..where((t) => t.productId.equals(productId)))
          .get();

  Future insertProduct(Insertable<DbProductData> product) =>
      into(dbProduct).insertOnConflictUpdate(product);

  Future insertSpec(Insertable<DbProductSpecData> spec) =>
      into(dbProductSpec).insert(spec);

  Future toggleBookmark(String productId, bool bookmarked) =>
      (update(dbProduct)..where((t) => t.id.equals(productId)))
          .write(DbProductCompanion(bookmarked: Value(bookmarked)));

  Future deleteSpecsForProduct(String productId) =>
      (delete(dbProductSpec)
        ..where((t) => t.productId.equals(productId)))
          .go();
}

// ─── CART DAO ────────────────────────────────────────────

@DriftAccessor(tables: [DbCartItem])
class CartDao extends DatabaseAccessor<TechHubDatabase>
    with _$CartDaoMixin {
  CartDao(super.db);

  Future<List<DbCartItemData>> findAllCartItems() =>
      select(dbCartItem).get();

  Stream<List<DbCartItemData>> watchCartItems() =>
      select(dbCartItem).watch();

  Future insertCartItem(Insertable<DbCartItemData> item) =>
      into(dbCartItem).insertOnConflictUpdate(item);

  Future deleteCartItem(String id) =>
      (delete(dbCartItem)..where((t) => t.id.equals(id))).go();

  Future clearCart() => delete(dbCartItem).go();
}

// ─── ORDER DAO ───────────────────────────────────────────

@DriftAccessor(tables: [DbOrder, DbOrderItem])
class OrderDao extends DatabaseAccessor<TechHubDatabase>
    with _$OrderDaoMixin {
  OrderDao(super.db);

  Future<List<DbOrderData>> findAllOrders() =>
      select(dbOrder).get();

  Stream<List<DbOrderData>> watchAllOrders() =>
      select(dbOrder).watch();

  Future<List<DbOrderItemData>> findItemsForOrder(int orderId) =>
      (select(dbOrderItem)..where((t) => t.orderId.equals(orderId))).get();

  Future insertOrder(Insertable<DbOrderData> order) =>
      into(dbOrder).insertOnConflictUpdate(order);

  Future insertOrderItem(Insertable<DbOrderItemData> item) =>
      into(dbOrderItem).insert(item);
}

// ─── SEARCH HISTORY DAO ──────────────────────────────────

@DriftAccessor(tables: [DbSearchHistory])
class SearchHistoryDao extends DatabaseAccessor<TechHubDatabase>
    with _$SearchHistoryDaoMixin {
  SearchHistoryDao(super.db);

  Future<List<DbSearchHistoryData>> findAll() =>
      (select(dbSearchHistory)
        ..orderBy([(t) => OrderingTerm.desc(t.searchedAt)]))
          .get();

  Stream<List<DbSearchHistoryData>> watchAll() =>
      (select(dbSearchHistory)
        ..orderBy([(t) => OrderingTerm.desc(t.searchedAt)]))
          .watch();

  Future insert(String query) => into(dbSearchHistory).insert(
    DbSearchHistoryCompanion.insert(
      query: query,
      searchedAt: DateTime.now(),
    ),
  );

  Future deleteQuery(String query) =>
      (delete(dbSearchHistory)..where((t) => t.query.equals(query))).go();

  Future clearAll() => delete(dbSearchHistory).go();
}