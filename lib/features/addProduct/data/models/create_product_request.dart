class CreateProductRequest {
  final String sellerId;
  final String name;
  final String description;
  final String arabicName;
  final String arabicDescription;
  final String coverPictureUrl;
  final num price;
  final int stock;
  final num weight;
  final String color;
  final num discountPercentage;
  final List<String> categories;
  final List<String>? productPictures;

  const CreateProductRequest({
    required this.sellerId,
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.discountPercentage,
    required this.categories,
    required this.productPictures,
  });

  Map<String, dynamic> toJson() {
    return {
      'sellerId': sellerId,
      'name': name,
      'description': description,
      // Backend currently validates these exact keys.
      'nameArabic': arabicName,
      'descriptionArabic': arabicDescription,
      // Keep these for compatibility with other API variants.
      'arabicName': arabicName,
      'arabicDescription': arabicDescription,
      'coverPictureUrl': coverPictureUrl,
      'price': price,
      'stock': stock,
      'weight': weight,
      'color': color,
      'discountPercentage': discountPercentage,
      'categories': categories,
      'productPictures': productPictures,
    };
  }
}
