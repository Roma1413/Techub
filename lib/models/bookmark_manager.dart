import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'product.dart';

class BookmarkManager {
  static const _key = 'bookmarks';

  final List<Product> _bookmarks = [];

  List<Product> get bookmarks => List.unmodifiable(_bookmarks);

  bool isBookmarked(String productId) =>
      _bookmarks.any((p) => p.id == productId);

  // ✅ LOAD FROM STORAGE
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data == null) return;

    final List decoded = jsonDecode(data);

    _bookmarks.clear();
    _bookmarks.addAll(
      decoded.map((e) => Product.fromJson(e)).toList(),
    );
  }

  // ✅ SAVE TO STORAGE
  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();

    final data = jsonEncode(
      _bookmarks.map((p) => {
        'id': p.id,
        'name': p.name,
        'description': p.description,
        'price': p.price,
        'originalPrice': p.originalPrice,
        'imageUrl': p.imageUrl,
        'rating': p.rating,
        'reviewCount': p.reviewCount,
        'inStock': p.inStock,
        'badge': p.badge,
        'specs': p.specs
            .map((s) => {'key': s.key, 'value': s.value})
            .toList(),
      }).toList(),
    );

    await prefs.setString(_key, data);
  }

  // ✅ TOGGLE BOOKMARK
  Future<void> toggle(Product product) async {
    if (isBookmarked(product.id)) {
      _bookmarks.removeWhere((p) => p.id == product.id);
    } else {
      _bookmarks.add(product);
    }

    await _save();
  }
}