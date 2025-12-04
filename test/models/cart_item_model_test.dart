import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/src/models/cart_item_model.dart';
import 'package:union_shop/src/models/product_model.dart';

void main() {
  group('CartItem', () {
    test('CartItem should store product and quantity correctly', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );

      // Act
      final cartItem = CartItem(
        product: product,
        quantity: 3,
      );

      // Assert
      expect(cartItem.product.title, equals('Test Product'));
      expect(cartItem.quantity, equals(3));
    });

    test('CartItem should store optional size and colour', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );

      // Act
      final cartItem = CartItem(
        product: product,
        quantity: 1,
        selectedSize: 'M',
        selectedColour: 'Blue',
      );

      // Assert
      expect(cartItem.selectedSize, equals('M'));
      expect(cartItem.selectedColour, equals('Blue'));
    });

    test('getTotalPrice should calculate correct price for regular product',
        () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      final cartItem = CartItem(
        product: product,
        quantity: 3,
      );

      // Act
      final totalPrice = cartItem.getTotalPrice();

      // Assert
      expect(totalPrice, equals(30.0)); // 10.00 * 3
    });

    test('getTotalPrice should use sale price when product is on sale', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
        isOnSale: true,
        salePrice: '£6.00',
      );
      final cartItem = CartItem(
        product: product,
        quantity: 2,
      );

      // Act
      final totalPrice = cartItem.getTotalPrice();

      // Assert
      expect(totalPrice, equals(12.0)); // 6.00 * 2
    });

    test('getTotalPrice should handle prices with commas', () {
      // Arrange
      const product = Product(
        title: 'Expensive Product',
        price: '£1,234.99',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      final cartItem = CartItem(
        product: product,
        quantity: 1,
      );

      // Act
      final totalPrice = cartItem.getTotalPrice();

      // Assert
      expect(totalPrice, equals(1234.99));
    });

    test('copyWith should create new instance with updated fields', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      final originalItem = CartItem(
        product: product,
        quantity: 2,
        selectedSize: 'S',
      );

      // Act
      final updatedItem = originalItem.copyWith(quantity: 5);

      // Assert
      expect(updatedItem.quantity, equals(5));
      expect(updatedItem.selectedSize, equals('S'));
      expect(originalItem.quantity, equals(2)); // Original unchanged
    });

    test('copyWith should allow updating multiple fields', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      final originalItem = CartItem(
        product: product,
        quantity: 2,
        selectedSize: 'S',
      );

      // Act
      final updatedItem = originalItem.copyWith(
        quantity: 5,
        selectedSize: 'L',
        selectedColour: 'Red',
      );

      // Assert
      expect(updatedItem.quantity, equals(5));
      expect(updatedItem.selectedSize, equals('L'));
      expect(updatedItem.selectedColour, equals('Red'));
    });

    test('toString should provide readable output', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      final cartItem = CartItem(
        product: product,
        quantity: 2,
        selectedSize: 'M',
      );

      // Act
      final string = cartItem.toString();

      // Assert
      expect(string, contains('Test Product'));
      expect(string, contains('quantity: 2'));
      expect(string, contains('size: M'));
    });
  });
}
