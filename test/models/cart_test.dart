import 'package:flutter_test/flutter_test.dart';
import 'package:techhub/models/cart_manager.dart';

void main() {
  group('CartItem', () {
    test('can instantiate', () {
      // Arrange
      late CartItem item;

      // Act
      item = CartItem(
        id: '1',
        productId: 'p1',
        name: 'iPhone 16 Pro',
        price: 999.00,
        quantity: 1,
        imageUrl: 'assets/prod/Iphone.jpg',
      );

      // Assert
      expect(item, isNotNull);
    });

    test('totalCost calculates correctly', () {
      // Arrange
      final item = CartItem(
        id: '1',
        productId: 'p1',
        name: 'iPhone 16 Pro',
        price: 999.00,
        quantity: 3,
        imageUrl: 'assets/prod/Iphone.jpg',
      );

      // Act
      final total = item.totalCost;

      // Assert
      expect(total, equals(2997.00));
    });
  });

  group('CartManager', () {
    late CartManager cartManager;

    setUp(() {
      cartManager = CartManager();
    });

    test('starts empty', () {
      expect(cartManager.items, isEmpty);
      expect(cartManager.isEmpty, isTrue);
    });

    test('can add item', () {
      // Arrange
      final item = CartItem(
        id: '1',
        productId: 'p1',
        name: 'iPhone 16 Pro',
        price: 999.00,
        quantity: 1,
        imageUrl: 'assets/prod/Iphone.jpg',
      );

      // Act
      cartManager.addItem(item);

      // Assert
      expect(cartManager.items.length, equals(1));
      expect(cartManager.isEmpty, isFalse);
    });

    test('can remove item', () {
      // Arrange
      final item = CartItem(
        id: '1',
        productId: 'p1',
        name: 'iPhone 16 Pro',
        price: 999.00,
        quantity: 1,
        imageUrl: 'assets/prod/Iphone.jpg',
      );
      cartManager.addItem(item);

      // Act
      cartManager.removeItem('1');

      // Assert
      expect(cartManager.items, isEmpty);
    });

    test('totalCost sums all items correctly', () {
      // Arrange
      cartManager.addItem(CartItem(
        id: '1',
        productId: 'p1',
        name: 'iPhone',
        price: 999.00,
        quantity: 1,
        imageUrl: '',
      ));
      cartManager.addItem(CartItem(
        id: '2',
        productId: 'p2',
        name: 'AirPods',
        price: 249.00,
        quantity: 2,
        imageUrl: '',
      ));

      // Act
      final total = cartManager.totalCost;

      // Assert
      expect(total, equals(1497.00)); // 999 + (249 * 2)
    });

    test('resetCart clears all items', () {
      // Arrange
      cartManager.addItem(CartItem(
        id: '1',
        productId: 'p1',
        name: 'iPhone',
        price: 999.00,
        quantity: 1,
        imageUrl: '',
      ));

      // Act
      cartManager.resetCart();

      // Assert
      expect(cartManager.items, isEmpty);
    });
  });
}