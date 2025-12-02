class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final String category;

  const Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.category = 'Uncategorized', // Default value
  });
}
