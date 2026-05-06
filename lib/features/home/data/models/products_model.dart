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
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'Unknown Product',
      description: json['description']?.toString() ?? '',
      arabicName: json['arabicName']?.toString() ?? '',
      arabicDescription: json['arabicDescription']?.toString() ?? '',
      coverPictureUrl: json['coverPictureUrl']?.toString() ??
          json['coverUrl']?.toString() ??
          json['imageUrl']?.toString() ??
          '',
      productPictures: _stringList(json['productPictures']),
      price: _toDouble(json['price']),
      stock: _toInt(json['stock']),
      weight: _toDouble(json['weight']),
      color: json['color']?.toString() ?? '',
      rating: _toDouble(json['rating']),
      reviewsCount: _toInt(json['reviewsCount']),
      discountPercentage: _toDouble(json['discountPercentage']),
      sellerId: json['sellerId']?.toString() ?? '',
      categories: _stringList(json['categories']),
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString()) ?? 0;
  }

  static List<String> _stringList(dynamic value) {
    if (value is List) {
      return value.map((e) => e.toString()).toList();
    }

    return [];
  }
}