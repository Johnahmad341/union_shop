import 'package:flutter/material.dart';
import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/repositories/product_repository.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';

class CollectionDetailPage extends StatefulWidget {
  const CollectionDetailPage({super.key});

  @override
  _CollectionDetailPageState createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> {
  String? _selectedSort;
  String? _selectedFilter;

  // Dummy data for dropdowns - can be expanded later
  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low'
  ];
  final List<String> _filterOptions = ['All', 'In Stock'];

  @override
  Widget build(BuildContext context) {
    // Get the collection title passed from the previous page
    final String collectionTitle =
        ModalRoute.of(context)!.settings.arguments as String;

    // Get the specific list of products for the current collection from the repository
    final List<Product> products =
        ProductRepository.getProductsForCollection(collectionTitle);

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
                  Text(
                    collectionTitle.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  // Real dropdowns
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
                  // Grid of products
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                errorBuilder: (context, error, stackTrace) {
                                  // Show a placeholder if the asset is not found
                                  return Container(
                                    color: Colors.grey[200],
                                    child: const Center(
                                        child:
                                            Icon(Icons.image_not_supported)),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(product.title, maxLines: 2),
                            ),
                            Text(product.price,
                                style: const TextStyle(color: Colors.grey)),
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
