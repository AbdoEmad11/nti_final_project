import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/data/models/products_model.dart';
import 'cart_state.dart';
import '../models/cart_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    loadCart();
  }

  final List<CartItemModel> _items = [];

  void loadCart() {
    if (_items.isEmpty) {
      emit(CartEmpty());
      return;
    }

    _emitLoaded();
  }

  void addProduct(ProductModel product) {
    final index = _items.indexWhere((item) => item.productId == product.id);

    if (index != -1) {
      final oldItem = _items[index];
      _items[index] = oldItem.copyWith(quantity: oldItem.quantity + 1);
    } else {
      _items.add(CartItemModel.fromProduct(product));
    }

    _emitLoaded();
  }

  void incrementQuantity(int itemId) {
    final index = _items.indexWhere((item) => item.id == itemId);

    if (index == -1) return;

    final item = _items[index];
    _items[index] = item.copyWith(quantity: item.quantity + 1);

    _emitLoaded();
  }

  void decrementQuantity(int itemId) {
    final index = _items.indexWhere((item) => item.id == itemId);

    if (index == -1) return;

    final item = _items[index];

    if (item.quantity > 1) {
      _items[index] = item.copyWith(quantity: item.quantity - 1);
    } else {
      _items.removeAt(index);
    }

    if (_items.isEmpty) {
      emit(CartEmpty());
    } else {
      _emitLoaded();
    }
  }

  void removeItem(int itemId) {
    _items.removeWhere((item) => item.id == itemId);

    if (_items.isEmpty) {
      emit(CartEmpty());
    } else {
      _emitLoaded();
    }
  }

  void clearCart() {
    _items.clear();
    emit(CartEmpty());
  }

  void _emitLoaded() {
    final subtotal = _items.fold<double>(
      0,
          (sum, item) => sum + item.total,
    );

    final summary = CartSummaryModel(
      subtotal: subtotal,
      taxRate: 0.08,
      shippingCost: subtotal > 500 ? 0.0 : 15.0,
    );

    emit(
      CartLoaded(
        items: List<CartItemModel>.from(_items),
        summary: summary,
      ),
    );
  }
}