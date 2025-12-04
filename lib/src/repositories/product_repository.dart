import 'package:union_shop/src/models/product_model.dart';

class ProductRepository {
  // The single source of truth for all products in the app.
  static const List<Product> _allProducts = [
    // Hoodies & Sweatshirts
    Product(
        title: 'UoP Crest Hoodie - Navy',
        price: '£34.99',
        imageUrl: 'assets/images/hoodies/uop_crest_hoodie_navy.jpg',
        description:
            'Classic navy hoodie with the University of Portsmouth crest.',
        category: 'Hoodies & Sweatshirts',
        availableSizes: ['S', 'M', 'L'],
        availableColours: ['Navy']),
    Product(
        title: 'Portsmouth Sweatshirt - Grey',
        price: '£29.99',
        imageUrl: 'assets/images/hoodies/portsmouth_sweatshirt_grey.jpg',
        description: 'A comfortable grey sweatshirt with Portsmouth branding.',
        category: 'Hoodies & Sweatshirts',
        availableSizes: ['S', 'M', 'L'],
        availableColours: ['Grey'],
        isOnSale: true,
        salePrice: '£19.99'),
    Product(
        title: 'Portsmouth Hoodie - Navy',
        price: '£32.99',
        imageUrl: 'assets/images/hoodies/portsmouth_hoodie_navy.jpg',
        description: 'A stylish navy hoodie with Portsmouth branding.',
        category: 'Hoodies & Sweatshirts',
        availableSizes: ['S', 'M', 'L'],
        availableColours: ['Navy', 'Black'],
        isOnSale: true,
        salePrice: '£24.99'),
    Product(
        title: 'UoP Crest Sweatshirt - Navy',
        price: '£29.99',
        imageUrl: 'assets/images/hoodies/uop_crest_sweatshirt_navy.jpg',
        description: 'A classic navy sweatshirt with the UoP crest.',
        category: 'Hoodies & Sweatshirts',
        availableSizes: ['S', 'M', 'L'],
        availableColours: ['Navy']),
    Product(
        title: 'Portsmouth Hoodie - Grey',
        price: '£32.99',
        imageUrl: 'assets/images/hoodies/portsmouth_hoodie_grey.jpg',
        description: 'A stylish grey hoodie with Portsmouth branding.',
        category: 'Hoodies & Sweatshirts',
        availableSizes: ['S', 'M', 'L'],
        availableColours: ['Grey', 'Black']),
    Product(
        title: 'UoP Crested Hoodie - Grey',
        price: '£34.99',
        imageUrl: 'assets/images/hoodies/uop_crested_hoodie_grey.jpg',
        description:
            'Classic grey hoodie with the University of Portsmouth crest.',
        category: 'Hoodies & Sweatshirts',
        availableSizes: ['S', 'M', 'L'],
        availableColours: ['Grey', 'Navy']),

    // T-Shirts
    Product(
        title: 'UoP Logo T-Shirt - White',
        price: '£15.00',
        imageUrl: 'assets/images/tshirts/uop_logo_tshirt_white.jpg',
        description: 'A simple and stylish white t-shirt with the UoP logo.',
        category: 'T-Shirts',
        availableSizes: ['S', 'M', 'L', 'XL'],
        availableColours: ['White'],
        isOnSale: true,
        salePrice: '£9.99'),
    Product(
        title: 'Portsmouth Anchor T-Shirt',
        price: '£17.50',
        imageUrl: 'assets/images/tshirts/portsmouth_anchor_tshirt.jpg',
        description: 'Navy t-shirt featuring a cool anchor design.',
        category: 'T-Shirts',
        availableSizes: ['S', 'M', 'L', 'XL'],
        availableColours: ['Navy', 'White'],
        isOnSale: true,
        salePrice: '£12.99'),
    Product(
        title: 'UoP Logo T-Shirt - Navy',
        price: '£15.00',
        imageUrl: 'assets/images/tshirts/uop_logo_tshirt_navy.jpg',
        description: 'A simple and stylish navy t-shirt with the UoP logo.',
        category: 'T-Shirts',
        availableSizes: ['S', 'M', 'L', 'XL'],
        availableColours: ['Navy', 'Black']),
    Product(
        title: 'UoP Crest T-Shirt - Navy',
        price: '£16.00',
        imageUrl: 'assets/images/tshirts/uop_crest_tshirt_navy.jpg',
        description: 'A classic navy t-shirt with the UoP crest.',
        category: 'T-Shirts',
        availableSizes: ['S', 'M', 'L', 'XL'],
        availableColours: ['Navy', 'White']),
    Product(
        title: 'Portsmouth Coordinates T-Shirt - White',
        price: '£17.50',
        imageUrl:
            'assets/images/tshirts/portsmouth_coordinates_tshirt_white.jpg',
        description: 'White t-shirt with Portsmouth coordinates design.',
        category: 'T-Shirts',
        availableSizes: ['S', 'M', 'L', 'XL'],
        availableColours: ['White', 'Grey']),
    Product(
        title: 'UoP Crest T-Shirt - Grey',
        price: '£16.00',
        imageUrl: 'assets/images/tshirts/uop_crest_tshirt_grey.jpg',
        description: 'A classic grey t-shirt with the UoP crest.',
        category: 'T-Shirts',
        availableSizes: ['S', 'M', 'L', 'XL'],
        availableColours: ['Grey', 'Black']),

    // Gifts & Souvenirs
    Product(
        title: 'Portsmouth City Magnet',
        price: '£4.50',
        imageUrl: 'assets/images/gifts/portsmouth_city_magnet.jpg',
        description: 'A lovely magnet to remember the city.',
        category: 'Gifts & Souvenirs'),
    Product(
        title: 'UoP Bear',
        price: '£15.00',
        imageUrl: 'assets/images/gifts/uop_bear.jpg',
        description: 'A cuddly UoP teddy bear, a perfect gift.',
        category: 'Gifts & Souvenirs',
        isOnSale: true,
        salePrice: '£10.99'),
    Product(
        title: 'UoP Crest Keyring',
        price: '£5.00',
        imageUrl: 'assets/images/gifts/uop_crest_keyring.jpg',
        description:
            'Keep your keys safe with this official UoP crest keyring.',
        category: 'Gifts & Souvenirs'),
    Product(
        title: 'Spinnaker Tower Pin Badge',
        price: '£3.99',
        imageUrl: 'assets/images/gifts/spinnaker_tower_pin_badge.jpg',
        description: 'A stylish pin badge of the iconic Spinnaker Tower.',
        category: 'Gifts & Souvenirs'),
    Product(
        title: 'UoP Water Bottle',
        price: '£12.00',
        imageUrl: 'assets/images/gifts/uop_water_bottle.jpg',
        description: 'Stay hydrated with this UoP branded water bottle.',
        category: 'Gifts & Souvenirs',
        availableColours: ['Purple', 'Black', 'White', 'Silver']),
    Product(
        title: 'Portsmouth City Postcard',
        price: '£1.00',
        imageUrl: 'assets/images/gifts/portsmouth_city_postcard.jpg',
        description:
            'Send a message from Portsmouth with this beautiful postcard.',
        category: 'Gifts & Souvenirs'),

    // Essentials
    Product(
        title: 'UoP Lanyard',
        price: '£4.00',
        imageUrl: 'assets/images/essentials/uop_lanyard.jpg',
        description: 'Official University of Portsmouth lanyard.',
        category: 'Essentials'),
    Product(
        title: 'A4 Refill Pad',
        price: '£3.50',
        imageUrl: 'assets/images/essentials/a4_refill_pad.jpg',
        description: '160 pages of lined A4 paper for your notes.',
        category: 'Essentials'),
    Product(
        title: 'UoP Pen',
        price: '£2.50',
        imageUrl: 'assets/images/essentials/uop_pen.jpg',
        description: 'A sleek pen with the University logo.',
        category: 'Essentials'),
    Product(
        title: 'Highlighter - Pack of 4',
        price: '£4.00',
        imageUrl: 'assets/images/essentials/highlighter_pack_4.jpg',
        description: 'A pack of four assorted colour highlighters.',
        category: 'Essentials'),
    Product(
        title: 'UoP Tote Bag',
        price: '£8.00',
        imageUrl: 'assets/images/essentials/uop_tote_bag.jpg',
        description: 'A handy tote bag for carrying your books and essentials.',
        category: 'Essentials',
        isOnSale: true,
        salePrice: '£5.99'),
    Product(
        title: 'UoP Notebook',
        price: '£6.00',
        imageUrl: 'assets/images/essentials/uop_notebook.jpg',
        description: 'A5 notebook with the University crest.',
        category: 'Essentials',
        isOnSale: true,
        salePrice: '£3.99'),
    Product(
        title: 'UoP Mug',
        price: '£7.99',
        imageUrl: 'assets/images/essentials/uop_mug.jpg',
        description:
            'Make your own coffee, baristas are expensive here in Pompey',
        category: 'Essentials',
        availableColours: ['White', 'Black', 'Purple', 'Navy', 'Grey'],
        availableSizes: ['250ml', '350ml', '500ml']),

    // Graduation
    Product(
        title: 'Graduation Bear',
        price: '£20.00',
        imageUrl: 'assets/images/graduation/graduation_bear.jpg',
        description: 'A special teddy bear wearing a graduation cap and gown.',
        category: 'Graduation'),
    Product(
        title: 'Class of 2024 Hoodie',
        price: '£38.00',
        imageUrl: 'assets/images/graduation/class_of_2024_hoodie.jpg',
        description:
            'Commemorate your graduation with this special edition hoodie.',
        category: 'Graduation',
        isOnSale: true,
        salePrice: '£29.99'),
    Product(
        title: 'Certificate Frame',
        price: '£25.00',
        imageUrl: 'assets/images/graduation/certificate_frame.jpg',
        description: 'A high-quality frame to display your degree certificate.',
        category: 'Graduation'),
    Product(
        title: 'Graduation Pin Badge',
        price: '£4.50',
        imageUrl: 'assets/images/graduation/graduation_pin_badge.jpg',
        description: 'A pin badge to celebrate your graduation.',
        category: 'Graduation'),
    Product(
        title: 'Engraved Pen',
        price: '£15.00',
        imageUrl: 'assets/images/graduation/engraved_pen.jpg',
        description: 'A premium engraved pen in a presentation box.',
        category: 'Graduation'),
    Product(
        title: 'UoP Cufflinks',
        price: '£18.00',
        imageUrl: 'assets/images/graduation/uop_cufflinks.jpg',
        description: 'Official University of Portsmouth cufflinks.',
        category: 'Graduation'),
  ];

  // Method to get all products.
  static List<Product> getAllProducts() {
    return _allProducts;
  }

  // Method to get all products that are on sale.
  static List<Product> getSaleProducts() {
    return _allProducts.where((product) => product.isOnSale).toList();
  }

  // Method to get a specified number of random products for the home page.
  static List<Product> getFeaturedProducts({int count = 8}) {
    final List<Product> shuffled = List.from(_allProducts)..shuffle();
    return shuffled.take(count).toList();
  }

  // Method to get all products belonging to a specific collection.
  static List<Product> getProductsForCollection(String collectionTitle) {
    // This is a more robust way to handle collections.
    // It also includes a fallback for categories like 'Summer Favourites'
    // which might contain items from multiple "real" categories.
    switch (collectionTitle) {
      case 'Summer Favourites':
        return _allProducts
            .where((p) =>
                p.category == 'T-Shirts' ||
                p.title.contains('Water Bottle') ||
                p.title.contains('Pin Badge') ||
                p.title.contains('Postcard') ||
                p.title.contains('Tote Bag'))
            .toList();
      default:
        return _allProducts
            .where((product) => product.category == collectionTitle)
            .toList();
    }
  }

  // Method to get all the collections for the collections page
  static List<Map<String, String>> getCollections() {
    return [
      {
        'title': 'Hoodies & Sweatshirts',
        'imageUrl': 'assets/images/collections/hoodies_sweatshirts.jpg',
      },
      {
        'title': 'T-Shirts',
        'imageUrl': 'assets/images/collections/t_shirts.jpg',
      },
      {
        'title': 'Essentials',
        'imageUrl': 'assets/images/collections/essentials.jpg',
      },
      {
        'title': 'Graduation',
        'imageUrl': 'assets/images/collections/graduation.jpg',
      },
      {
        'title': 'Summer Favourites',
        'imageUrl': 'assets/images/collections/summer_favourites.jpg',
      },
      {
        'title': 'Gifts & Souvenirs',
        'imageUrl': 'assets/images/collections/gifts_souvenirs.jpg',
      },
    ];
  }
}
