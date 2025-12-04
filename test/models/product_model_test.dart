import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/src/models/product_model.dart';

void main() {
  group('Product', () {
    test('Product should be created with required fields', () {
      // Arrange & Act
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );

      // Assert
      expect(product.title, equals('Test Product'));
      expect(product.price, equals('£10.00'));
      expect(product.imageUrl, equals('test.jpg'));
      expect(product.description, equals('Test Description'));
    });

    test('Product should have default values for optional fields', () {
      // Arrange & Act
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );

      // Assert
      expect(product.category, equals('Uncategorized'));
      expect(product.availableSizes, equals(const <String>[]));
      expect(product.availableColours, equals(const <String>[]));
      expect(product.isOnSale, equals(false));
      expect(product.salePrice, isNull);
    });

    test('Product should store category correctly', () {
      // Arrange & Act
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
        category: 'Hoodies & Sweatshirts',
      );

      // Assert
      expect(product.category, equals('Hoodies & Sweatshirts'));
    });

    test('Product should store available sizes', () {
      // Arrange & Act
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
        availableSizes: ['S', 'M', 'L', 'XL'],
      );

      // Assert
      expect(product.availableSizes, equals(['S', 'M', 'L', 'XL']));
      expect(product.availableSizes.length, equals(4));
    });

    test('Product should store available colours', () {
      // Arrange & Act
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
        availableColours: ['Red', 'Blue', 'Black'],
      );

      // Assert
      expect(product.availableColours, equals(['Red', 'Blue', 'Black']));
      expect(product.availableColours.length, equals(3));
    });

    test('Product should store sale status and sale price', () {
      // Arrange & Act
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
        isOnSale: true,
        salePrice: '£6.00',
      );

      // Assert
      expect(product.isOnSale, equals(true));
      expect(product.salePrice, equals('£6.00'));
    });

    test('Product should allow all fields to be customized', () {
      // Arrange & Act
      const product = Product(
        title: 'Premium Hoodie',
        price: '£49.99',
        imageUrl: 'hoodie.jpg',
        description: 'A premium hoodie with University branding',
        category: 'Hoodies & Sweatshirts',
        availableSizes: ['S', 'M', 'L'],
        availableColours: ['Navy', 'Grey'],
        isOnSale: true,
        salePrice: '£34.99',
      );

      // Assert
      expect(product.title, equals('Premium Hoodie'));
      expect(product.price, equals('£49.99'));
      expect(product.imageUrl, equals('hoodie.jpg'));
      expect(product.description, contains('University'));
      expect(product.category, equals('Hoodies & Sweatshirts'));
      expect(product.availableSizes, equals(['S', 'M', 'L']));
      expect(product.availableColours, equals(['Navy', 'Grey']));
      expect(product.isOnSale, equals(true));
      expect(product.salePrice, equals('£34.99'));
    });

    test('Product with empty sizes and colours should have empty lists', () {
      // Arrange & Act
      const product = Product(
        title: 'Simple Product',
        price: '£5.00',
        imageUrl: 'simple.jpg',
        description: 'A simple product',
        availableSizes: [],
        availableColours: [],
      );

      // Assert
      expect(product.availableSizes, isEmpty);
      expect(product.availableColours, isEmpty);
    });

    test('Product should be const constructible (immutable)', () {
      // Arrange & Act
      const product1 = Product(
        title: 'Test',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test',
      );
      const product2 = Product(
        title: 'Test',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test',
      );

      // Assert - Same const instances
      expect(identical(product1, product2), equals(true));
    });
  });
}
