import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';
import '../models/cart_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    loadCart();
  }

  // Mock data matching your screenshot
  void loadCart() {
    emit(CartLoading());

    // Simulate network delay
    Future.delayed(const Duration(milliseconds: 500), () {
      final items = [
        CartItemModel(
          id: 1,
          name: 'Terra Runners',
          variant: 'Size: 42 • Beige',
          price: 210.00,
          imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
          quantity: 1,
        ),
        CartItemModel(
          id: 2,
          name: 'Aura Headphones',
          variant: 'Matte Black',
          price: 349.00,
          imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
          quantity: 1,
        ),
        CartItemModel(
          id: 3,
          name: 'Zenith Watch S3',
          variant: 'Cloud White',
          price: 199.00,
          imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
          quantity: 1,
        ),
      ];

      final subtotal = items.fold<double>(0, (sum, item) => sum + item.total);
      final summary = CartSummaryModel(
        subtotal: subtotal,
        taxRate: 0.08,
        shippingCost: 0.0, // Free shipping
      );

      emit(CartLoaded(items: items, summary: summary));
    });
  }

  void incrementQuantity(int itemId) {
    if (state is! CartLoaded) return;

    final currentState = state as CartLoaded;
    final updatedItems = currentState.items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();

    _updateCart(updatedItems);
  }

  void decrementQuantity(int itemId) {
    if (state is! CartLoaded) return;

    final currentState = state as CartLoaded;
    final updatedItems = currentState.items.map((item) {
      if (item.id == itemId && item.quantity > 1) {
        return item.copyWith(quantity: item.quantity - 1);
      }
      return item;
    }).toList();

    _updateCart(updatedItems);
  }

  void removeItem(int itemId) {
    if (state is! CartLoaded) return;

    final currentState = state as CartLoaded;
    final updatedItems = currentState.items.where((item) => item.id != itemId).toList();

    if (updatedItems.isEmpty) {
      emit(CartEmpty());
    } else {
      _updateCart(updatedItems);
    }
  }

  void _updateCart(List<CartItemModel> items) {
    final subtotal = items.fold<double>(0, (sum, item) => sum + item.total);
    final summary = CartSummaryModel(
      subtotal: subtotal,
      taxRate: 0.08,
      shippingCost: subtotal > 500 ? 0.0 : 15.0, // Free shipping over $500
    );

    emit(CartLoaded(items: items, summary: summary));
  }

  void clearCart() {
    emit(CartEmpty());
  }
}