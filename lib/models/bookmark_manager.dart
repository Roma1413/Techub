import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'product.dart';

class BookmarkManager {
  /// Old global key (pre–per-account); migrated once per signed-in user.
  static const _legacyKey = 'bookmarks';

  String? _userId;

  final List<Product> _bookmarks = [];

  List<Product> get bookmarks => List.unmodifiable(_bookmarks);

  bool isBookmarked(String productId) =>
      _bookmarks.any((p) => p.id == productId);

  String get _storageKey {
    final id = _userId;
    if (id == null || id.isEmpty) {
      return 'bookmarks__guest';
    }
    return 'bookmarks_$id';
  }

  /// Call when the signed-in user changes (login, logout, or account switch).
  /// Clears memory and loads bookmarks for that user from storage.
  Future<void> bindToUser(String? firebaseUid) async {
    _userId = firebaseUid;
    _bookmarks.clear();
    await load();
  }

  Future<void> _migrateLegacyIfNeeded(SharedPreferences prefs) async {
    final key = _storageKey;
    if (prefs.getString(key) != null) return;
    final legacy = prefs.getString(_legacyKey);
    if (legacy == null || legacy.isEmpty) return;
    await prefs.setString(key, legacy);
    await prefs.remove(_legacyKey);
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    if (_userId != null && _userId!.isNotEmpty) {
      await _migrateLegacyIfNeeded(prefs);
    }

    final data = prefs.getString(_storageKey);
    if (data == null) return;

    final List decoded = jsonDecode(data);

    _bookmarks.clear();
    _bookmarks.addAll(
      decoded.map((e) => Product.fromJson(e)).toList(),
    );
  }

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

    await prefs.setString(_storageKey, data);
  }

  Future<void> toggle(Product product) async {
    if (isBookmarked(product.id)) {
      _bookmarks.removeWhere((p) => p.id == product.id);
    } else {
      _bookmarks.add(product);
    }

    await _save();
  }
}
