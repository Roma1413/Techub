import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const _kLogin = 'techhub_login';

  Future<void> invalidate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kLogin, false);
  }

  Future<void> cacheUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kLogin, true);
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kLogin) ?? false;
  }
}

class TechHubAuth extends ChangeNotifier {
  bool _loggedIn = false;
  final _cache = AppCache();

  Future<bool> get loggedIn => _cache.isUserLoggedIn();

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _loggedIn = false;
    await _cache.invalidate();
    notifyListeners();
  }

  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _loggedIn = true;
    await _cache.cacheUser();
    notifyListeners();
    return _loggedIn;
  }
}
