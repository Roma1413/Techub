import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/favorites_service.dart';
import 'product.dart';

class BookmarkManager extends ChangeNotifier {
  static const _legacyKey = 'bookmarks';

  final FavoritesService _favoritesService = FavoritesService();

  String? _userId;
  StreamSubscription<List<Product>>? _cloudSubscription;

  final List<Product> _bookmarks = [];

  List<Product> get bookmarks => List.unmodifiable(_bookmarks);

  bool get usesCloud => _userId != null && _userId!.isNotEmpty;

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
  Future<void> bindToUser(String? firebaseUid) async {
    await _cloudSubscription?.cancel();
    _cloudSubscription = null;
    _userId = firebaseUid;
    _bookmarks.clear();

    if (!usesCloud) {
      await _loadFromPrefs();
      notifyListeners();
      return;
    }

    final local = await _readFromPrefs();

    try {
      final remote = await _favoritesService.fetchAll(_userId!);
      if (remote.isEmpty && local.isNotEmpty) {
        await _favoritesService.syncAll(_userId!, local);
        _bookmarks.addAll(local);
      } else {
        _bookmarks.addAll(remote.isNotEmpty ? remote : local);
      }
      await _saveToPrefs();

      _cloudSubscription = _favoritesService.watchAll(_userId!).listen(
        (products) {
          _bookmarks
            ..clear()
            ..addAll(products);
          _saveToPrefs();
          notifyListeners();
        },
        onError: (_) {},
      );
    } catch (_) {
      _bookmarks.addAll(local);
    }

    notifyListeners();
  }

  Future<void> _migrateLegacyIfNeeded(SharedPreferences prefs) async {
    final key = _storageKey;
    if (prefs.getString(key) != null) return;
    final legacy = prefs.getString(_legacyKey);
    if (legacy == null || legacy.isEmpty) return;
    await prefs.setString(key, legacy);
    await prefs.remove(_legacyKey);
  }

  Future<List<Product>> _readFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (usesCloud) {
      await _migrateLegacyIfNeeded(prefs);
    }

    final data = prefs.getString(_storageKey);
    if (data == null) return [];

    final List decoded = jsonDecode(data);
    return decoded.map((e) => Product.fromJson(e)).toList();
  }

  Future<void> _loadFromPrefs() async {
    _bookmarks
      ..clear()
      ..addAll(await _readFromPrefs());
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(
      _bookmarks.map(FavoritesService.productToMap).toList(),
    );
    await prefs.setString(_storageKey, data);
  }

  Future<void> toggle(Product product) async {
    final adding = !isBookmarked(product.id);
    if (adding) {
      _bookmarks.add(product);
    } else {
      _bookmarks.removeWhere((p) => p.id == product.id);
    }
    notifyListeners();

    if (usesCloud) {
      try {
        if (adding) {
          await _favoritesService.add(_userId!, product);
        } else {
          await _favoritesService.remove(_userId!, product.id);
        }
      } catch (_) {
        // Keep local cache; cloud sync retries on next bindToUser.
      }
    }

    await _saveToPrefs();
  }

  @override
  void dispose() {
    _cloudSubscription?.cancel();
    super.dispose();
  }
}
