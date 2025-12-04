import 'package:flutter/material.dart';
import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/repositories/product_repository.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';
import 'package:union_shop/src/widgets/product_card.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  String? _selectedSort;
  String? _selectedFilter;

  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
  ];

  final List<String> _filterOptions = ['All', 'In Stock'];

  double _parsePrice(String price) {
    final cleaned = price.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Copy to avoid mutating the repository's const list
    List<Product> products = List<Product>.from(
      ProductRepository.getAllProducts(),
    );

    if (_selectedFilter == 'In Stock') {
      products = products.where((p) => p.price.isNotEmpty).toList();
    }

    if (_selectedSort == 'Price: Low to High') {
      products
          .sort((a, b) => _parsePrice(a.price).compareTo(_parsePrice(b.price)));
    } else if (_selectedSort == 'Price: High to Low') {
      products
          .sort((a, b) => _parsePrice(b.price).compareTo(_parsePrice(a.price)));
    }

    int crossAxisCount;
    if (screenWidth < 600) {
      crossAxisCount = 2;
    } else if (screenWidth < 900) {
      crossAxisCount = 3;
    } else if (screenWidth < 1200) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 5;
    }

    return Scaffold(
      appBar: const UnionAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'All Products',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildDropdown(
                      'Sort by',
                      _sortOptions,
                      _selectedSort,
                      (newValue) {
                        setState(() {
                          _selectedSort = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildDropdown(
                      'Filter',
                      _filterOptions,
                      _selectedFilter,
                      (newValue) {
                        setState(() {
                          _selectedFilter = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
            const UnionFooter(),
          ],
        ),
      ),
    );
  }
}
