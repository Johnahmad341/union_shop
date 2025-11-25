import 'package:flutter/material.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  // Dummy data for our collections. In a real app, this would come from a database.
  static const List<Map<String, String>> _collections = [
    {
      'title': 'Hoodies & Sweatshirts',
      'imageUrl':
          'https://images.unsplash.com/photo-1620799140408-edc6d5f93528?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1072&q=80',
    },
    {
      'title': 'T-Shirts',
      'imageUrl':
          'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
    },
    {
      'title': 'Essentials',
      'imageUrl':
          'https://images.unsplash.com/photo-1587855049254-351f403757a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    },
    {
      'title': 'Graduation',
      'imageUrl':
          'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    },
    {
      'title': 'Summer Favourites',
      'imageUrl':
          'https://images.unsplash.com/photo-1507525428034-b723a996f329?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    },
    {
      'title': 'Gifts & Souvenirs',
      'imageUrl':
          'https://images.unsplash.com/photo-1593954286589-7093292c48a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
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
                      childAspectRatio: 1.8, // Adjust the card shape (width/height)
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
        // This is a placeholder for future navigation.
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
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
