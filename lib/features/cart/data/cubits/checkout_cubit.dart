// ============================================
// lib/features/cart/data/cubits/checkout_cubit.dart
// ============================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkout_state.dart';
import '../models/checkout_model.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial()) {
    loadCheckoutData();
  }

  void loadCheckoutData() {
    emit(CheckoutLoading());

    // Mock data matching the screenshot
    final address = const AddressModel(
      name: 'Alex Thorne',
      street: '842 High Street, Kensington',
      city: 'London',
      zipCode: 'W8 4SG',
      country: 'United Kingdom',
      phone: '+44 7700 900077',
    );

    final paymentMethods = [
      const PaymentMethodModel(
        id: 'visa_1234',
        name: 'Visa ending in 1234',
        subtitle: 'Expires 12/25',
        cardLastFour: '1234',
        expiryDate: '12/25',
        isSelected: true,
      ),
      const PaymentMethodModel(
        id: 'apple_pay',
        name: 'Apple Pay',
        subtitle: 'Default Wallet',
        isSelected: false,
      ),
      const PaymentMethodModel(
        id: 'google_pay',
        name: 'Google Pay',
        subtitle: 'Default Wallet',
        isSelected: false,
      ),
    ];

    emit(CheckoutLoaded(CheckoutModel(
      address: address,
      paymentMethods: paymentMethods,
      selectedPaymentId: 'visa_1234',
      currentStep: CheckoutStep.payment,
    )));
  }

  void selectPaymentMethod(String paymentId) {
    if (state is! CheckoutLoaded) return;

    final current = state as CheckoutLoaded;
    final updatedMethods = current.checkout.paymentMethods.map((method) {
      return method.copyWith(isSelected: method.id == paymentId);
    }).toList();

    emit(current.copyWith(current.checkout.copyWith(
      paymentMethods: updatedMethods,
      selectedPaymentId: paymentId,
    )));
  }

  void changeStep(CheckoutStep step) {
    if (state is! CheckoutLoaded) return;
    final current = state as CheckoutLoaded;
    emit(current.copyWith(current.checkout.copyWith(currentStep: step)));
  }

  void placeOrder() {
    if (state is! CheckoutLoaded) return;
    // Simulate API call
    emit(CheckoutLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(CheckoutOrderPlaced());
    });
  }
}