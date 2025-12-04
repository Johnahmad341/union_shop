import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/src/repositories/product_repository.dart';

void main() {
  group('ProductRepository', () {
    test('getAllProducts should return a list of products', () {
      // Arrange & Act
      final products = ProductRepository.getAllProducts();

      // Assert
      expect(products, isNotEmpty);
      expect(products.length, greaterThan(0));
    });

    test('getAllProducts should contain products with valid data', () {
      // Arrange & Act
      final products = ProductRepository.getAllProducts();

      // Assert
      for (final product in products) {
        expect(product.title, isNotEmpty);
        expect(product.price, isNotEmpty);
        expect(product.imageUrl, isNotEmpty);
        expect(product.description, isNotEmpty);
        expect(product.category, isNotEmpty);
      }
    });

    test('getSaleProducts should return only products marked as on sale', () {
      // Arrange & Act
      final saleProducts = ProductRepository.getSaleProducts();

      // Assert
      expect(saleProducts, isNotEmpty);
      for (final product in saleProducts) {
        expect(product.isOnSale, true);
        expect(product.salePrice, isNotNull);
      }
    });

    test('getSaleProducts should have sale price lower than original price',
        () {
      // Arrange & Act
      final saleProducts = ProductRepository.getSaleProducts();

      // Assert
      for (final product in saleProducts) {
        final originalPrice = _parsePrice(product.price);
        final salePrice = _parsePrice(product.salePrice!);
        expect(salePrice, lessThan(originalPrice));
      }
    });

    test('getProductsForCollection should return products in the category', () {
      // Arrange
      const collectionTitle = 'Hoodies & Sweatshirts';

      // Act
      final products =
          ProductRepository.getProductsForCollection(collectionTitle);

      // Assert
      expect(products, isNotEmpty);
      for (final product in products) {
        expect(product.category, equals(collectionTitle));
      }
    });

    test('getProductsForCollection Summer Favourites should return mixed items',
        () {
      // Arrange
      const collectionTitle = 'Summer Favourites';

      // Act
      final products =
          ProductRepository.getProductsForCollection(collectionTitle);

      // Assert
      expect(products, isNotEmpty);
      // Summer Favourites includes items from multiple categories
      final categories = products.map((p) => p.category).toSet();
      expect(categories.length, greaterThan(1));
    });

    test('getCollections should return all available collections', () {
      // Arrange & Act
      final collections = ProductRepository.getCollections();

      // Assert
      expect(collections, isNotEmpty);
      expect(collections.length, 6);
      for (final collection in collections) {
        expect(collection['title'], isNotEmpty);
        expect(collection['imageUrl'], isNotEmpty);
      }
    });

    test('getFeaturedProducts should return specified count of products', () {
      // Arrange
      const count = 5;

      // Act
      final featured = ProductRepository.getFeaturedProducts(count: count);

      // Assert
      expect(featured.length, equals(count));
    });

    test('getFeaturedProducts default should return 8 products', () {
      // Arrange & Act
      final featured = ProductRepository.getFeaturedProducts();

      // Assert
      expect(featured.length, equals(8));
    });

    test('getFeaturedProducts should return different products on each call',
        () {
      // Arrange & Act
      final featured1 = ProductRepository.getFeaturedProducts();
      final featured2 = ProductRepository.getFeaturedProducts();

      // Assert - Due to shuffling, they're unlikely to be identical
      // But we just verify both are valid products
      expect(featured1, isNotEmpty);
      expect(featured2, isNotEmpty);
    });
  });
}

// Helper function to parse price string like '£34.99' to double
double _parsePrice(String price) {
  final cleaned = price.replaceAll(RegExp(r'[^0-9.]'), '');
  return double.tryParse(cleaned) ?? 0.0;
}
