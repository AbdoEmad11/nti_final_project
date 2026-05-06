import 'package:nti_final_project/features/home/data/models/products_model.dart';

class CartItemModel {
  final int id;
  final String productId;
  final String name;
  final String variant;
  final double price;
  final String imageUrl;
  int quantity;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.variant,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  factory CartItemModel.fromProduct(ProductModel product) {
    return CartItemModel(
      id: product.id.hashCode,
      productId: product.id,
      name: product.name,
      variant: product.color.isNotEmpty ? product.color : 'Default',
      price: product.price,
      imageUrl: product.coverPictureUrl,
      quantity: 1,
    );
  }

  double get total => price * quantity;

  CartItemModel copyWith({
    int? id,
    String? productId,
    String? name,
    String? variant,
    double? price,
    String? imageUrl,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      variant: variant ?? this.variant,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartSummaryModel {
  final double subtotal;
  final double taxRate;
  final double shippingCost;

  CartSummaryModel({
    required this.subtotal,
    this.taxRate = 0.08,
    this.shippingCost = 0.0,
  });

  double get tax => subtotal * taxRate;
  double get total => subtotal + tax + shippingCost;
  bool get isFreeShipping => shippingCost == 0;
}