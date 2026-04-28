// ============================================
// lib/features/cart/data/cubits/checkout_state.dart
// ============================================

import 'package:equatable/equatable.dart';
import '../models/checkout_model.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final CheckoutModel checkout;

  const CheckoutLoaded(this.checkout);

  CheckoutLoaded copyWith(CheckoutModel? checkout) {
    return CheckoutLoaded(checkout ?? this.checkout);
  }

  @override
  List<Object?> get props => [checkout];
}

class CheckoutError extends CheckoutState {
  final String message;

  const CheckoutError(this.message);

  @override
  List<Object?> get props => [message];
}

class CheckoutOrderPlaced extends CheckoutState {}