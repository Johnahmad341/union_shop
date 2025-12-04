import 'package:flutter/material.dart';
import 'package:union_shop/src/models/product_model.dart';
import 'package:union_shop/src/services/search_service.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';
import 'package:union_shop/src/widgets/product_card.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  String? _selectedSort = 'Featured';
  String? _selectedCategory;
  String? _selectedSaleFilter;

  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
    'Discount: High to Low',
  ];

  final List<String> _categoryOptions = [
    'All Categories',
    'Hoodies & Sweatshirts',
    'T-Shirts',
    'Gifts',
    'Graduation',
    'Essentials',
  ];

  final List<String> _saleFilterOptions = ['All Products', 'Sale Items Only'];

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
    final String searchQuery =
        ModalRoute.of(context)!.settings.arguments as String;

    // Get search results
    List<Product> searchResults = SearchService.searchProducts(searchQuery);

    // Apply category filter
    if (_selectedCategory != null && _selectedCategory != 'All Categories') {
      searchResults =
          searchResults.where((p) => p.category == _selectedCategory).toList();
    }

    // Apply sale filter
    if (_selectedSaleFilter == 'Sale Items Only') {
      searchResults = searchResults.where((p) => p.isOnSale).toList();
    }

    // Apply sorting
    if (_selectedSort == 'Price: Low to High') {
      searchResults
          .sort((a, b) => _parsePrice(a.price).compareTo(_parsePrice(b.price)));
    } else if (_selectedSort == 'Price: High to Low') {
      searchResults
          .sort((a, b) => _parsePrice(b.price).compareTo(_parsePrice(a.price)));
    } else if (_selectedSort == 'Discount: High to Low') {
      searchResults.sort((a, b) {
        if (!a.isOnSale || a.salePrice == null) return 1;
        if (!b.isOnSale || b.salePrice == null) return -1;
        final discountA = _parsePrice(a.price) - _parsePrice(a.salePrice!);
        final discountB = _parsePrice(b.price) - _parsePrice(b.salePrice!);
        return discountB.compareTo(discountA);
      });
    }

    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate number of columns based on screen width
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
            // Header with search info
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search Results',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '"$searchQuery"',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${searchResults.length} product${searchResults.length != 1 ? 's' : ''} found',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            if (searchResults.isEmpty)
              // No results state
              Container(
                color: Colors.white,
                height: 400,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No products found',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try a different search term',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/all-products',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'Browse All Products',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              // Sort and filter section
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    Row(
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
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildDropdown(
                            'Category',
                            _categoryOptions,
                            _selectedCategory,
                            (newValue) {
                              setState(() {
                                _selectedCategory = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: _buildDropdown(
                        'Sale Filter',
                        _saleFilterOptions,
                        _selectedSaleFilter,
                        (newValue) {
                          setState(() {
                            _selectedSaleFilter = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

            // Products grid
            if (searchResults.isNotEmpty)
              Container(
                color: Colors.white,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: searchResults[index]);
                  },
                ),
              ),

            const SizedBox(height: 16),

            const UnionFooter(),
          ],
        ),
      ),
    );
  }
}
