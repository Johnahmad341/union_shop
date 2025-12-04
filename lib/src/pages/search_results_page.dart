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
  late List<Product> searchResults;
  late String searchQuery;
  String _sortBy = 'Featured';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get search query from route arguments
    searchQuery = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    // Perform search
    searchResults = SearchService.searchProducts(searchQuery);
  }

  void _applySorting(String sortOption) {
    setState(() {
      _sortBy = sortOption;
      if (sortOption == 'Price: Low to High') {
        searchResults = SearchService.sortByPriceAsc(searchResults);
      } else if (sortOption == 'Price: High to Low') {
        searchResults = SearchService.sortByPriceDesc(searchResults);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                child: Row(
                  children: [
                    const Text(
                      'Sort by:',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _sortBy,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _applySorting(newValue);
                          }
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'Featured',
                            child: Text('Featured'),
                          ),
                          DropdownMenuItem(
                            value: 'Price: Low to High',
                            child: Text('Price: Low to High'),
                          ),
                          DropdownMenuItem(
                            value: 'Price: High to Low',
                            child: Text('Price: High to Low'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            // Products grid
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
