class Product {
  const Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    this.description = '',
    this.imageAsset,
    this.isFeatured = false,
  });

  final int id;
  final int categoryId;
  final String name;
  final double price;
  final String description;
  final String? imageAsset;
  final bool isFeatured;
}
