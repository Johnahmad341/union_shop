import 'package:flutter/material.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  static const List<Map<String, String>> _collections = [
    {
      'title': 'Hoodies & Sweatshirts',
      'imageUrl': 'assets/images/hoodies_sweatshirts.jpg',
    },
    {
      'title': 'T-Shirts',
      'imageUrl': 'assets/images/t_shirts.jpg',
    },
    {
      'title': 'Essentials',
      'imageUrl': 'assets/images/essentials.jpg',
    },
    {
      'title': 'Graduation',
      'imageUrl': 'assets/images/graduation.jpg',
    },
    {
      'title': 'Summer Favourites',
      'imageUrl': 'assets/images/summer_favourites.jpg',
    },
    {
      'title': 'Gifts & Souvenirs',
      'imageUrl': 'assets/images/gifts_souvenirs.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                    'Collections',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Browse our curated collections of university merchandise. Find the perfect gear to show your Portsmouth pride.',
                    style: TextStyle(
                        fontSize: 16, height: 1.5, color: Colors.black54),
                  ),
                  const SizedBox(height: 32),
                  GridView.builder(
                    shrinkWrap: true, // Important for GridView inside a Column
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 700 ? 2 : 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio:
                          1.8, // Adjust the card shape (width/height)
                    ),
                    itemCount: _collections.length,
                    itemBuilder: (context, index) {
                      final collection = _collections[index];
                      return _buildCollectionCard(
                        context,
                        collection['title']!,
                        collection['imageUrl']!,
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

  // A helper widget to create a visual card for each collection
  Widget _buildCollectionCard(
      BuildContext context, String title, String imageUrl) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail page, passing the collection title as an argument
        Navigator.pushNamed(context, '/collection-detail', arguments: title);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.45),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
