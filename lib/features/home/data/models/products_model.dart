class ProductModel {
  final String id;
  final String name;
  final String description;
  final String arabicName;
  final String arabicDescription;
  final String coverPictureUrl;
  final List<String> productPictures;
  final double price;
  final int stock;
  final double weight;
  final String color;
  final double rating;
  final int reviewsCount;
  final double discountPercentage;
  final String sellerId;
  final List<String> categories;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
    required this.discountPercentage,
    required this.sellerId,
    required this.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      arabicName: json['arabicName'],
      arabicDescription: json['arabicDescription'],
      coverPictureUrl: json['coverPictureUrl'],
      productPictures: json['productPictures'] != null
          ? List<String>.from(json['productPictures'])
          : [],
      price: (json['price'] as num).toDouble(),
      stock: json['stock'],
      weight: (json['weight'] as num).toDouble(),
      color: json['color'],
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'],
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      sellerId: json['sellerId'],
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : [],
    );
  }
}
