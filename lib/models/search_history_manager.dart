import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryManager {
  static const _key = 'search_history';
  static const int _maxItems = 10;

  final List<String> _history = [];

  List<String> get history => List.unmodifiable(_history);

  // Call this once at app startup before using the manager
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_key) ?? [];
    _history
      ..clear()
      ..addAll(saved);
  }

  Future<void> add(String query) async {
    final q = query.trim();
    if (q.isEmpty) return;
    _history.remove(q);
    _history.insert(0, q);
    if (_history.length > _maxItems) _history.removeLast();
    await _save();
  }

  Future<void> remove(String query) async {
    _history.remove(query);
    await _save();
  }

  Future<void> clear() async {
    _history.clear();
    await _save();
  }

  List<String> suggestions(String query) {
    if (query.isEmpty) return _history;
    return _history
        .where((h) => h.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, _history);
  }
}