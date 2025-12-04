import 'package:flutter/material.dart';
import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/repositories/product_repository.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';

class SaleCollectionPage extends StatefulWidget {
  const SaleCollectionPage({super.key});

  @override
  _SaleCollectionPageState createState() => _SaleCollectionPageState();
}

class _SaleCollectionPageState extends State<SaleCollectionPage> {
  String? _selectedSort;
  String? _selectedFilter;

  // Sort and filter options
  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
    'Discount: High to Low'
  ];
  final List<String> _filterOptions = ['All', 'In Stock'];

  @override
  Widget build(BuildContext context) {
    // Get all products that are on sale
    List<Product> products = ProductRepository.getSaleProducts();

    // Filter logic (dummy: only 'In Stock' supported)
    if (_selectedFilter == 'In Stock') {
      products = products
          .where((p) => p.price != '')
          .toList(); // Replace with real stock logic
    }

    // Sort logic
    if (_selectedSort == 'Price: Low to High') {
      products.sort((a, b) =>
          _parsePrice(a.salePrice!).compareTo(_parsePrice(b.salePrice!)));
    } else if (_selectedSort == 'Price: High to Low') {
      products.sort((a, b) =>
          _parsePrice(b.salePrice!).compareTo(_parsePrice(a.salePrice!)));
    } else if (_selectedSort == 'Discount: High to Low') {
      products.sort((a, b) {
        double discountA = _parsePrice(a.price) - _parsePrice(a.salePrice!);
        double discountB = _parsePrice(b.price) - _parsePrice(b.salePrice!);
        return discountB.compareTo(discountA);
      });
    }
    // 'Featured' is default order

    return Scaffold(
      appBar: const UnionAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'SALE ITEMS',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Grab a bargain with our selection of sale items. Limited stock available!',
                    style: TextStyle(
                        fontSize: 16, height: 1.5, color: Colors.black54),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                          child: _buildDropdown(
                              'Sort by', _sortOptions, _selectedSort,
                              (newValue) {
                        setState(() {
                          _selectedSort = newValue;
                        });
                      })),
                      const SizedBox(width: 16),
                      Expanded(
                          child: _buildDropdown(
                              'Filter', _filterOptions, _selectedFilter,
                              (newValue) {
                        setState(() {
                          _selectedFilter = newValue;
                        });
                      })),
                    ],
                  ),
                  const SizedBox(height: 32),
                  products.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text(
                              'No sale items available at the moment.',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).size.width > 600 ? 3 : 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/product',
                                    arguments: product);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      product.imageUrl,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey[200],
                                          child: const Center(
                                              child: Icon(
                                                  Icons.image_not_supported)),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(product.title, maxLines: 2),
                                  ),
                                  // Sale price display
                                  if (product.isOnSale &&
                                      product.salePrice != null)
                                    Row(
                                      children: [
                                        Text(
                                          product.price,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          product.salePrice!,
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  else
                                    Text(product.price,
                                        style: const TextStyle(
                                            color: Colors.grey)),
                                ],
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
            const UnionFooter(),
          ],
        ),
      ),
    );
  }

  // Helper to parse price string like '£34.99' to double
  double _parsePrice(String price) {
    final cleaned = price.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
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
}
