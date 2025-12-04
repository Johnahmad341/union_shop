import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/repositories/product_repository.dart';

/// Service to handle product search functionality
class SearchService {
  /// Search products by query across title and category
  /// Returns a list of matching products
  static List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return [];
    }

    final lowerQuery = query.toLowerCase();
    final allProducts = ProductRepository.getAllProducts();

    return allProducts
        .where((product) =>
            product.title.toLowerCase().contains(lowerQuery) ||
            product.category.toLowerCase().contains(lowerQuery) ||
            product.description.toLowerCase().contains(lowerQuery))
        .toList();
  }

  /// Get products by category
  static List<Product> getProductsByCategory(String category) {
    final allProducts = ProductRepository.getAllProducts();
    return allProducts
        .where((product) =>
            product.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  /// Get all unique categories
  static List<String> getAllCategories() {
    final allProducts = ProductRepository.getAllProducts();
    final categories = <String>{};
    for (var product in allProducts) {
      categories.add(product.category);
    }
    return categories.toList()..sort();
  }

  /// Filter products by price range
  static List<Product> filterByPrice(
    List<Product> products,
    double minPrice,
    double maxPrice,
  ) {
    return products.where((product) {
      final priceString =
          product.price.replaceAll('£', '').replaceAll(',', '');
      final price = double.tryParse(priceString) ?? 0.0;
      return price >= minPrice && price <= maxPrice;
    }).toList();
  }

  /// Sort products by price (ascending)
  static List<Product> sortByPriceAsc(List<Product> products) {
    final sorted = List<Product>.from(products);
    sorted.sort((a, b) {
      final priceA =
          double.tryParse(a.price.replaceAll('£', '').replaceAll(',', '')) ??
              0.0;
      final priceB =
          double.tryParse(b.price.replaceAll('£', '').replaceAll(',', '')) ??
              0.0;
      return priceA.compareTo(priceB);
    });
    return sorted;
  }

  /// Sort products by price (descending)
  static List<Product> sortByPriceDesc(List<Product> products) {
    final sorted = List<Product>.from(products);
    sorted.sort((a, b) {
      final priceA =
          double.tryParse(a.price.replaceAll('£', '').replaceAll(',', '')) ??
              0.0;
      final priceB =
          double.tryParse(b.price.replaceAll('£', '').replaceAll(',', '')) ??
              0.0;
      return priceB.compareTo(priceA);
    });
    return sorted;
  }
}
