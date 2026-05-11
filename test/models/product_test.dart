import 'package:flutter_test/flutter_test.dart';
import 'package:techhub/models/product.dart';

void main() {
  group('ProductSpec', () {
    test('can instantiate', () {
      // Arrange
      late ProductSpec spec;

      // Act
      spec = ProductSpec('Chip', 'A18 Pro');

      // Assert
      expect(spec, isNotNull);
    });

    test('can receive parameters', () {
      // Arrange
      const key = 'Storage';
      const value = '256GB';

      // Act
      final spec = ProductSpec(key, value);

      // Assert
      expect(spec.key, equals(key));
      expect(spec.value, equals(value));
    });

    test('can instantiate from JSON', () {
      // Arrange
      final json = {'key': 'RAM', 'value': '24GB'};

      // Act
      final spec = ProductSpec.fromJson(json);

      // Assert
      expect(spec.key, equals('RAM'));
      expect(spec.value, equals('24GB'));
    });
  });

  group('Product', () {
    test('can instantiate', () {
      // Arrange
      late Product product;

      // Act
      product = Product(
        id: 'p1',
        name: 'iPhone 16 Pro',
        description: 'Test description',
        price: 999.00,
        originalPrice: 999.00,
        imageUrl: 'assets/prod/Iphone.jpg',
        rating: 4.9,
        reviewCount: 2841,
        specs: [],
      );

      // Assert
      expect(product, isNotNull);
    });

    test('can receive parameters', () {
      // Arrange
      const id = 'p1';
      const name = 'iPhone 16 Pro';
      const description = 'Test';
      const price = 999.00;
      const originalPrice = 999.00;
      const imageUrl = 'assets/prod/Iphone.jpg';
      const rating = 4.9;
      const reviewCount = 2841;
      final specs = [ProductSpec('Chip', 'A18 Pro')];

      // Act
      final product = Product(
        id: id,
        name: name,
        description: description,
        price: price,
        originalPrice: originalPrice,
        imageUrl: imageUrl,
        rating: rating,
        reviewCount: reviewCount,
        specs: specs,
      );

      // Assert
      expect(product.id, equals(id));
      expect(product.name, equals(name));
      expect(product.description, equals(description));
      expect(product.price, equals(price));
      expect(product.originalPrice, equals(originalPrice));
      expect(product.imageUrl, equals(imageUrl));
      expect(product.rating, equals(rating));
      expect(product.reviewCount, equals(reviewCount));
      expect(product.specs.length, equals(1));
    });

    test('isOnSale returns true when originalPrice > price', () {
      // Arrange
      final product = Product(
        id: 'p2',
        name: 'MacBook Pro',
        description: 'Test',
        price: 1999.00,
        originalPrice: 2199.00, // higher than price
        imageUrl: 'assets/prod/mac.jpg',
        rating: 4.8,
        reviewCount: 1204,
        specs: [],
      );

      // Act & Assert
      expect(product.isOnSale, isTrue);
    });

    test('isOnSale returns false when originalPrice equals price', () {
      // Arrange
      final product = Product(
        id: 'p1',
        name: 'iPhone 16 Pro',
        description: 'Test',
        price: 999.00,
        originalPrice: 999.00, // same as price
        imageUrl: 'assets/prod/Iphone.jpg',
        rating: 4.9,
        reviewCount: 2841,
        specs: [],
      );

      // Act & Assert
      expect(product.isOnSale, isFalse);
    });

    test('bookmarked defaults to false', () {
      // Arrange & Act
      final product = Product(
        id: 'p1',
        name: 'iPhone 16 Pro',
        description: 'Test',
        price: 999.00,
        originalPrice: 999.00,
        imageUrl: 'assets/prod/Iphone.jpg',
        rating: 4.9,
        reviewCount: 2841,
        specs: [],
      );

      // Assert
      expect(product.bookmarked, isFalse);
    });

    test('can instantiate from JSON', () {
      // Arrange
      final json = {
        'id': 'p1',
        'name': 'iPhone 16 Pro',
        'description': 'Test description',
        'price': 999.00,
        'originalPrice': 999.00,
        'imageUrl': 'assets/prod/Iphone.jpg',
        'rating': 4.9,
        'reviewCount': 2841,
        'inStock': true,
        'badge': 'NEW',
        'bookmarked': false,
        'specs': [
          {'key': 'Chip', 'value': 'A18 Pro'},
        ],
      };

      // Act
      final product = Product.fromJson(json);

      // Assert
      expect(product.id, equals('p1'));
      expect(product.name, equals('iPhone 16 Pro'));
      expect(product.price, equals(999.00));
      expect(product.badge, equals('NEW'));
      expect(product.bookmarked, isFalse);
      expect(product.specs.length, equals(1));
      expect(product.specs.first.key, equals('Chip'));
    });

    test('getRatingAndReviews returns correct format', () {
      // Arrange
      final product = Product(
        id: 'p1',
        name: 'iPhone 16 Pro',
        description: 'Test',
        price: 999.00,
        originalPrice: 999.00,
        imageUrl: 'assets/prod/Iphone.jpg',
        rating: 4.9,
        reviewCount: 2841,
        specs: [],
      );

      // Act
      final result = product.getRatingAndReviews();

      // Assert
      expect(result, contains('4.9'));
      expect(result, contains('2841'));
    });
  });
}