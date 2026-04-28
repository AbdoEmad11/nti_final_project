import 'package:equatable/equatable.dart';
import '../models/cart_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;
  final CartSummaryModel summary;

  const CartLoaded({
    required this.items,
    required this.summary,
  });

  CartLoaded copyWith({
    List<CartItemModel>? items,
    CartSummaryModel? summary,
  }) {
    return CartLoaded(
      items: items ?? this.items,
      summary: summary ?? this.summary,
    );
  }

  @override
  List<Object?> get props => [items, summary];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartEmpty extends CartState {}