class CartItemModel {
  final int id;
  final String name;
  final String variant;
  final double price;
  final String imageUrl;
  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.variant,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  double get total => price * quantity;

  CartItemModel copyWith({
    int? id,
    String? name,
    String? variant,
    double? price,
    String? imageUrl,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
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