import 'package:union_shop/src/models/product_model.dart';

class CartItem {
  final Product product;
  final int quantity;
  final String? selectedSize;
  final String? selectedColour;

  CartItem({
    required this.product,
    required this.quantity,
    this.selectedSize,
    this.selectedColour,
  });

  /// Calculate the total price for this item (product price × quantity)
  /// Uses sale price if product is on sale
  double getTotalPrice() {
    // Use sale price if available, otherwise use regular price
    final priceToUse = (product.isOnSale && product.salePrice != null)
        ? product.salePrice!
        : product.price;
    final priceString = priceToUse.replaceAll('£', '').replaceAll(',', '');
    final price = double.tryParse(priceString) ?? 0.0;
    return price * quantity;
  }

  /// Create a copy with optional updated fields
  CartItem copyWith({
    Product? product,
    int? quantity,
    String? selectedSize,
    String? selectedColour,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColour: selectedColour ?? this.selectedColour,
    );
  }

  @override
  String toString() =>
      'CartItem(product: ${product.title}, quantity: $quantity, size: $selectedSize, colour: $selectedColour)';
}
