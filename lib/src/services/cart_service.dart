import 'package:flutter/material.dart';
import 'package:union_shop/src/models/cart_item_model.dart';
import 'package:union_shop/src/models/product_model.dart';

/// Service to manage shopping cart state
/// Uses ChangeNotifier to notify listeners when cart changes
class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  /// Get all items in the cart
  List<CartItem> get items => _items;

  /// Get number of items in cart
  int get itemCount => _items.length;

  /// Get total number of products (considering quantities)
  int get totalProductCount =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  /// Get total price of all items in cart
  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.getTotalPrice());
  }

  /// Add item to cart or update quantity if already exists
  void addToCart(
    Product product, {
    int quantity = 1,
    String? selectedSize,
    String? selectedColour,
  }) {
    // Check if product already exists in cart with same size/color
    final existingIndex = _items.indexWhere(
      (item) =>
          item.product.title == product.title &&
          item.selectedSize == selectedSize &&
          item.selectedColour == selectedColour,
    );

    if (existingIndex >= 0) {
      // Update quantity of existing item
      final existingItem = _items[existingIndex];
      _items[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
    } else {
      // Add new item to cart
      _items.add(
        CartItem(
          product: product,
          quantity: quantity,
          selectedSize: selectedSize,
          selectedColour: selectedColour,
        ),
      );
    }

    notifyListeners();
  }

  /// Remove item from cart by index
  void removeFromCart(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  /// Update quantity of item at index
  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _items.length) {
      if (newQuantity <= 0) {
        removeFromCart(index);
      } else {
        _items[index] = _items[index].copyWith(quantity: newQuantity);
        notifyListeners();
      }
    }
  }

  /// Clear all items from cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  /// Check if cart is empty
  bool get isEmpty => _items.isEmpty;

  /// Check if cart has items
  bool get isNotEmpty => _items.isNotEmpty;
}
