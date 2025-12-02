import 'package:flutter/material.dart';
import 'package:union_shop/src/pages/product_detail_page.dart'; // We need the Product class
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';
import 'package:union_shop/src/models/product_model.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the collection title passed from the previous page
    final String collectionTitle =
        ModalRoute.of(context)!.settings.arguments as String;

    // Dummy product data for this collection
    final List<Product> products = List.generate(
      6,
      (index) => Product(
        title: '$collectionTitle Product ${index + 1}',
        price: '£${(index + 1) * 5}.00',
        imageUrl:
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        description: 'A description for $collectionTitle Product ${index + 1}.',
      ),
    );

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
                  // Placeholder dropdowns (they don't need to work yet)
                  Row(
                    children: [
                      Expanded(child: _buildDummyDropdown('Sort by')),
                      const SizedBox(width: 16),
                      Expanded(child: _buildDummyDropdown('Filter')),
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
                              child: Image.network(product.imageUrl,
                                  fit: BoxFit.cover, width: double.infinity),
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

  // Helper widget for the placeholder dropdowns
  Widget _buildDummyDropdown(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
