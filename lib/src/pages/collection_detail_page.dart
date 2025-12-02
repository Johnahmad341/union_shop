import 'package:flutter/material.dart';
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

    // Get the specific list of products for the current collection
    final List<Product> products = _getProductsForCollection(collectionTitle);

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
                              child: Image.asset(
                                product.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  // Show a placeholder if the asset is not found
                                  return Container(
                                    color: Colors.grey[200],
                                    child: const Center(
                                        child: Icon(Icons.image_not_supported)),
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

  // This function acts as our dummy database.
  // It returns a specific list of products based on the collection title.
  List<Product> _getProductsForCollection(String title) {
    // Note: The 'Gifts & Souvenirs' case handles multiple spellings.
    switch (title) {
      case 'Hoodies & Sweatshirts':
        return const [
          Product(
              title: 'UoP Crest Hoodie - Navy',
              price: '£34.99',
              imageUrl: 'assets/images/hoodies/uop_crest_hoodie_navy.jpg',
              description:
                  'Classic navy hoodie with the University of Portsmouth crest.'),
          Product(
              title: 'Portsmouth Sweatshirt - Grey',
              price: '£29.99',
              imageUrl: 'assets/images/hoodies/portsmouth_sweatshirt_grey.jpg',
              description:
                  'A comfortable grey sweatshirt with Portsmouth branding.'),
          Product(
              title: 'Portsmouth Hoodie - Navy',
              price: '£32.99',
              imageUrl: 'assets/images/hoodies/portsmouth_hoodie_navy.jpg',
              description: 'A stylish navy hoodie with Portsmouth branding.'),
          Product(
              title: 'UoP Crest Sweatshirt - Navy',
              price: '£29.99',
              imageUrl: 'assets/images/hoodies/uop_crest_sweatshirt_navy.jpg',
              description: 'A classic navy sweatshirt with the UoP crest.'),
          Product(
              title: 'Portsmouth Hoodie - Grey',
              price: '£32.99',
              imageUrl: 'assets/images/hoodies/portsmouth_hoodie_grey.jpg',
              description: 'A stylish grey hoodie with Portsmouth branding.'),
          Product(
              title: 'UoP Crested Hoodie - Grey',
              price: '£34.99',
              imageUrl: 'assets/images/hoodies/uop_crested_hoodie_grey.jpg',
              description:
                  'Classic grey hoodie with the University of Portsmouth crest.'),
        ];
      case 'T-Shirts':
        return const [
          Product(
              title: 'UoP Logo T-Shirt - White',
              price: '£15.00',
              imageUrl: 'assets/images/tshirts/uop_logo_tshirt_white.jpg',
              description:
                  'A simple and stylish white t-shirt with the UoP logo.'),
          Product(
              title: 'Portsmouth Anchor T-Shirt',
              price: '£17.50',
              imageUrl: 'assets/images/tshirts/portsmouth_anchor_tshirt.jpg',
              description: 'Navy t-shirt featuring a cool anchor design.'),
          Product(
              title: 'UoP Logo T-Shirt - Navy',
              price: '£15.00',
              imageUrl: 'assets/images/tshirts/uop_logo_tshirt_navy.jpg',
              description:
                  'A simple and stylish navy t-shirt with the UoP logo.'),
          Product(
              title: 'UoP Crest T-Shirt - Navy',
              price: '£16.00',
              imageUrl: 'assets/images/tshirts/uop_crest_tshirt_navy.jpg',
              description: 'A classic navy t-shirt with the UoP crest.'),
          Product(
              title: 'Portsmouth Coordinates T-Shirt - White',
              price: '£17.50',
              imageUrl:
                  'assets/images/tshirts/portsmouth_coordinates_tshirt_white.jpg',
              description: 'White t-shirt with Portsmouth coordinates design.'),
          Product(
              title: 'UoP Crest T-Shirt - Grey',
              price: '£16.00',
              imageUrl: 'assets/images/tshirts/uop_crest_tshirt_grey.jpg',
              description: 'A classic grey t-shirt with the UoP crest.'),
        ];
      case 'Summer Favourites':
        return const [
          Product(
              title: 'UoP Logo T-Shirt - White',
              price: '£15.00',
              imageUrl: 'assets/images/tshirts/uop_logo_tshirt_white.jpg',
              description:
                  'A simple and stylish white t-shirt, perfect for summer.'),
          Product(
              title: 'Portsmouth Anchor T-Shirt',
              price: '£17.50',
              imageUrl: 'assets/images/tshirts/portsmouth_anchor_tshirt.jpg',
              description:
                  'Navy t-shirt featuring a cool anchor design, great for the seaside.'),
          Product(
              title: 'UoP Water Bottle',
              price: '£12.00',
              imageUrl: 'assets/images/gifts/uop_water_bottle.jpg',
              description:
                  'Stay hydrated during the summer with this UoP branded water bottle.'),
          Product(
              title: 'UoP Tote Bag',
              price: '£8.00',
              imageUrl: 'assets/images/essentials/uop_tote_bag.jpg',
              description:
                  'A handy tote bag for your summer outings and beach trips.'),
          Product(
              title: 'Spinnaker Tower Pin Badge',
              price: '£3.99',
              imageUrl: 'assets/images/gifts/spinnaker_tower_pin_badge.jpg',
              description:
                  'A stylish pin badge of the iconic Spinnaker Tower, a great summer souvenir.'),
          Product(
              title: 'Portsmouth City Postcard',
              price: '£1.00',
              imageUrl: 'assets/images/gifts/portsmouth_city_postcard.jpg',
              description:
                  'Send a message from sunny Portsmouth with this beautiful postcard.'),
        ];
      case 'Gift & Souverniers': // Handles the typo from the previous version
        return const [
          Product(
              title: 'Portsmouth City Magnet',
              price: '£4.50',
              imageUrl: 'assets/images/gifts/portsmouth_city_magnet.jpg',
              description: 'A lovely magnet to remember the city.'),
          Product(
              title: 'UoP Crest Keyring',
              price: '£5.00',
              imageUrl: 'assets/images/gifts/uop_crest_keyring.jpg',
              description:
                  'Keep your keys safe with this official UoP crest keyring.'),
          Product(
              title: 'Spinnaker Tower Pin Badge',
              price: '£3.99',
              imageUrl: 'assets/images/gifts/spinnaker_tower_pin_badge.jpg',
              description:
                  'A stylish pin badge of the iconic Spinnaker Tower.'),
          Product(
              title: 'UoP Water Bottle',
              price: '£12.00',
              imageUrl: 'assets/images/gifts/uop_water_bottle.jpg',
              description: 'Stay hydrated with this UoP branded water bottle.'),
          Product(
              title: 'UoP Bear',
              price: '£15.00',
              imageUrl: 'assets/images/gifts/uop_bear.jpg',
              description: 'A cuddly UoP teddy bear, a perfect gift.'),
          Product(
              title: 'Portsmouth City Postcard',
              price: '£1.00',
              imageUrl: 'assets/images/gifts/portsmouth_city_postcard.jpg',
              description:
                  'Send a message from Portsmouth with this beautiful postcard.'),
        ];
      case 'Essentials':
        return const [
          Product(
              title: 'UoP Lanyard',
              price: '£4.00',
              imageUrl: 'assets/images/essentials/uop_lanyard.jpg',
              description: 'Official University of Portsmouth lanyard.'),
          Product(
              title: 'A4 Refill Pad',
              price: '£3.50',
              imageUrl: 'assets/images/essentials/a4_refill_pad.jpg',
              description: '160 pages of lined A4 paper for your notes.'),
          Product(
              title: 'UoP Pen',
              price: '£2.50',
              imageUrl: 'assets/images/essentials/uop_pen.jpg',
              description: 'A sleek pen with the University logo.'),
          Product(
              title: 'Highlighter - Pack of 4',
              price: '£4.00',
              imageUrl: 'assets/images/essentials/highlighter_pack_4.jpg',
              description: 'A pack of four assorted colour highlighters.'),
          Product(
              title: 'UoP Tote Bag',
              price: '£8.00',
              imageUrl: 'assets/images/essentials/uop_tote_bag.jpg',
              description:
                  'A handy tote bag for carrying your books and essentials.'),
          Product(
              title: 'UoP Notebook',
              price: '£6.00',
              imageUrl: 'assets/images/essentials/uop_notebook.jpg',
              description: 'A5 notebook with the University crest.'),
        ];
      case 'Graduation':
        return const [
          Product(
              title: 'Graduation Bear',
              price: '£20.00',
              imageUrl: 'assets/images/graduation/graduation_bear.jpg',
              description:
                  'A special teddy bear wearing a graduation cap and gown.'),
          Product(
              title: 'Class of 2024 Hoodie',
              price: '£38.00',
              imageUrl: 'assets/images/graduation/class_of_2024_hoodie.jpg',
              description:
                  'Commemorate your graduation with this special edition hoodie.'),
          Product(
              title: 'Certificate Frame',
              price: '£25.00',
              imageUrl: 'assets/images/graduation/certificate_frame.jpg',
              description:
                  'A high-quality frame to display your degree certificate.'),
          Product(
              title: 'Graduation Pin Badge',
              price: '£4.50',
              imageUrl: 'assets/images/graduation/graduation_pin_badge.jpg',
              description: 'A pin badge to celebrate your graduation.'),
          Product(
              title: 'Engraved Pen',
              price: '£15.00',
              imageUrl: 'assets/images/graduation/engraved_pen.jpg',
              description: 'A premium engraved pen in a presentation box.'),
          Product(
              title: 'UoP Cufflinks',
              price: '£18.00',
              imageUrl: 'assets/images/graduation/uop_cufflinks.jpg',
              description: 'Official University of Portsmouth cufflinks.'),
        ];
      default:
        // Return a default list if the collection is not found
        return List.generate(
            4,
            (index) => Product(
                title: '$title Placeholder ${index + 1}',
                price: '£9.99',
                imageUrl: 'https://via.placeholder.com/300',
                description: 'This is a placeholder item.'));
    }
  }
}
