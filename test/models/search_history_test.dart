import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techhub/models/search_history_manager.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('SearchHistoryManager', () {
    late SearchHistoryManager manager;

    setUp(() {
      manager = SearchHistoryManager();
    });

    test('starts empty', () {
      expect(manager.history, isEmpty);
    });

    test('can add a query', () async {
      // Act
      await manager.add('iPhone');

      // Assert
      expect(manager.history, contains('iPhone'));
    });

    test('does not add empty query', () async {
      // Act
      await manager.add('');

      // Assert
      expect(manager.history, isEmpty);
    });

    test('moves duplicate to top', () async {
      // Arrange
      await manager.add('iPhone');
      await manager.add('Samsung');

      // Act
      await manager.add('iPhone'); // add again

      // Assert
      expect(manager.history.first, equals('iPhone'));
      expect(manager.history.length, equals(2)); // no duplicate
    });

    test('can remove a query', () async {
      // Arrange
      await manager.add('iPhone');

      // Act
      await manager.remove('iPhone');

      // Assert
      expect(manager.history, isEmpty);
    });

    test('can clear all history', () async {
      // Arrange
      await manager.add('iPhone');
      await manager.add('Samsung');

      // Act
      await manager.clear();

      // Assert
      expect(manager.history, isEmpty);
    });

    test('suggestions filters correctly', () async {
      // Arrange
      await manager.add('iPhone 16 Pro');
      await manager.add('Samsung Galaxy');
      await manager.add('iPad Pro');

      // Act
      final results = manager.suggestions('i');

      // Assert
      expect(results, contains('iPhone 16 Pro'));
      expect(results, contains('iPad Pro'));
      expect(results, isNot(contains('Samsung Galaxy')));
    });

    test('suggestions returns all when query is empty', () async {
      // Arrange
      await manager.add('iPhone');
      await manager.add('Samsung');

      // Act
      final results = manager.suggestions('');

      // Assert
      expect(results.length, equals(2));
    });
  });
}