class ProductModel {
  final String id;
  final String name;
  final double price;
  final String category;
  final int stockQuantity;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.stockQuantity,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'stockQuantity': stockQuantity,
      'description': description,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0.0,
      category: json['category'] ?? '',
      stockQuantity: json['stockQuantity'] ?? 0,
      description: json['description'] ?? '',
    );
  }
}
