import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/services/cart_service.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? _selectedSize;
  String? _selectedColour;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    // Get the product object passed from the previous page
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: const UnionAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.imageUrl, // Use product's image
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Image unavailable',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product name
                  Text(
                    product.title, // Use product's title
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Product price with sale logic
                  if (product.isOnSale && product.salePrice != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.price,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.salePrice!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      product.price,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d2963),
                      ),
                    ),

                  const SizedBox(height: 24),

                  // Dropdowns
                  _buildDropdown(
                      'Size',
                      product.availableSizes.isNotEmpty
                          ? product.availableSizes
                          : const <String>[],
                      _selectedSize, (newValue) {
                    setState(() {
                      _selectedSize = newValue;
                    });
                  }),
                  const SizedBox(height: 16),
                  _buildDropdown(
                      'Colour',
                      product.availableColours.isNotEmpty
                          ? product.availableColours
                          : const <String>[],
                      _selectedColour, (newValue) {
                    setState(() {
                      _selectedColour = newValue;
                    });
                  }),

                  const SizedBox(height: 24),

                  // Quantity selector
                  _buildQuantitySelector(),

                  const SizedBox(height: 24),

                  // Add to basket button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add item to cart
                        context.read<CartService>().addToCart(
                              product,
                              quantity: _quantity,
                              selectedSize: _selectedSize,
                              selectedColour: _selectedColour,
                            );

                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added $_quantity ${_quantity > 1 ? 'items' : 'item'} to cart',
                            ),
                            duration: const Duration(seconds: 2),
                            backgroundColor: const Color(0xFF4d2963),
                          ),
                        );

                        // Reset quantity
                        setState(() {
                          _quantity = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Add to basket',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description, // Use product's description
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // Footer
            const UnionFooter(), // Use the custom footer
          ],
        ),
      ),
    );
  }

  // Helper widget for the dropdowns
  Widget _buildDropdown(String hint, List<String> items, String? selectedValue,
      ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint),
          value: selectedValue,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Helper widget for the quantity selector
  Widget _buildQuantitySelector() {
    return Row(
      children: [
        const Text('Quantity', style: TextStyle(fontSize: 16)),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _quantity > 1
              ? () {
                  setState(() {
                    _quantity--;
                  });
                }
              : null,
        ),
        Text('$_quantity', style: const TextStyle(fontSize: 18)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _quantity++;
            });
          },
        ),
      ],
    );
  }
}
