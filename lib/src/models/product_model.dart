class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final String category;

  // Per-product selectable options
  final List<String> availableSizes; // e.g. ['S', 'M', 'L']
  final List<String> availableColours; // e.g. ['Red', 'Blue']

  const Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.category = 'Uncategorized',
    this.availableSizes = const [],
    this.availableColours = const [],
  });
}
