import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/services/cart_service.dart';

void main() {
  group('CartService', () {
    late CartService cartService;

    setUp(() {
      cartService = CartService();
    });

    test('initial cart should be empty', () {
      // Assert
      expect(cartService.items, isEmpty);
      expect(cartService.itemCount, 0);
      expect(cartService.isEmpty, true);
    });

    test('addToCart should add product to cart', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );

      // Act
      cartService.addToCart(product, quantity: 1);

      // Assert
      expect(cartService.items, isNotEmpty);
      expect(cartService.itemCount, 1);
      expect(cartService.items[0].product.title, equals('Test Product'));
    });

    test('addToCart should increase quantity if product already exists', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );

      // Act
      cartService.addToCart(product, quantity: 1);
      cartService.addToCart(product, quantity: 2);

      // Assert
      expect(cartService.itemCount, 1); // Still one item
      expect(cartService.items[0].quantity, equals(3)); // But quantity is 3
    });

    test('addToCart with different sizes should create separate items', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
        availableSizes: ['S', 'M', 'L'],
      );

      // Act
      cartService.addToCart(product, quantity: 1, selectedSize: 'S');
      cartService.addToCart(product, quantity: 1, selectedSize: 'M');

      // Assert
      expect(cartService.itemCount, 2);
      expect(cartService.items[0].selectedSize, equals('S'));
      expect(cartService.items[1].selectedSize, equals('M'));
    });

    test('removeFromCart should remove item at index', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      cartService.addToCart(product);

      // Act
      cartService.removeFromCart(0);

      // Assert
      expect(cartService.items, isEmpty);
    });

    test('updateQuantity should change quantity of item', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      cartService.addToCart(product, quantity: 1);

      // Act
      cartService.updateQuantity(0, 5);

      // Assert
      expect(cartService.items[0].quantity, equals(5));
    });

    test('updateQuantity to 0 or less should remove item', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      cartService.addToCart(product, quantity: 1);

      // Act
      cartService.updateQuantity(0, 0);

      // Assert
      expect(cartService.items, isEmpty);
    });

    test('totalProductCount should sum all quantities', () {
      // Arrange
      const product1 = Product(
        title: 'Product 1',
        price: '£10.00',
        imageUrl: 'test1.jpg',
        description: 'Test 1',
      );
      const product2 = Product(
        title: 'Product 2',
        price: '£20.00',
        imageUrl: 'test2.jpg',
        description: 'Test 2',
      );

      // Act
      cartService.addToCart(product1, quantity: 2);
      cartService.addToCart(product2, quantity: 3);

      // Assert
      expect(cartService.totalProductCount, equals(5));
    });

    test('totalPrice should calculate correct total with regular prices', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );

      // Act
      cartService.addToCart(product, quantity: 3);

      // Assert
      expect(cartService.totalPrice, equals(30.0));
    });

    test('totalPrice should use sale price when product is on sale', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
        isOnSale: true,
        salePrice: '£6.00',
      );

      // Act
      cartService.addToCart(product, quantity: 2);

      // Assert
      expect(cartService.totalPrice, equals(12.0)); // 6.00 * 2
    });

    test('clearCart should remove all items', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );
      cartService.addToCart(product, quantity: 3);

      // Act
      cartService.clearCart();

      // Assert
      expect(cartService.items, isEmpty);
      expect(cartService.isEmpty, true);
    });

    test('isNotEmpty should return true when cart has items', () {
      // Arrange
      const product = Product(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'test.jpg',
        description: 'Test Description',
      );

      // Act
      cartService.addToCart(product);

      // Assert
      expect(cartService.isNotEmpty, true);
      expect(cartService.isEmpty, false);
    });
  });
}
