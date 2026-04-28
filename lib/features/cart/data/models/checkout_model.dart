// ============================================
// lib/features/cart/data/models/checkout_model.dart
// ============================================

import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final String name;
  final String street;
  final String city;
  final String zipCode;
  final String country;
  final String phone;

  const AddressModel({
    required this.name,
    required this.street,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.phone,
  });

  String get formattedAddress => '$street\n$city, $zipCode, $country';

  @override
  List<Object?> get props => [name, street, city, zipCode, country, phone];
}

class PaymentMethodModel extends Equatable {
  final String id;
  final String name;
  final String subtitle;
  final String? cardLastFour;
  final String? expiryDate;
  final bool isSelected;

  const PaymentMethodModel({
    required this.id,
    required this.name,
    required this.subtitle,
    this.cardLastFour,
    this.expiryDate,
    this.isSelected = false,
  });

  PaymentMethodModel copyWith({
    String? id,
    String? name,
    String? subtitle,
    String? cardLastFour,
    String? expiryDate,
    bool? isSelected,
  }) {
    return PaymentMethodModel(
      id: id ?? this.id,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      cardLastFour: cardLastFour ?? this.cardLastFour,
      expiryDate: expiryDate ?? this.expiryDate,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [id, name, subtitle, cardLastFour, expiryDate, isSelected];
}

enum CheckoutStep { shipping, payment, review }

class CheckoutModel extends Equatable {
  final AddressModel? address;
  final List<PaymentMethodModel> paymentMethods;
  final String? selectedPaymentId;
  final CheckoutStep currentStep;

  const CheckoutModel({
    this.address,
    this.paymentMethods = const [],
    this.selectedPaymentId,
    this.currentStep = CheckoutStep.shipping,
  });

  PaymentMethodModel? get selectedPayment {
    if (selectedPaymentId == null) return null;
    try {
      return paymentMethods.firstWhere((p) => p.id == selectedPaymentId);
    } catch (_) {
      return null;
    }
  }

  CheckoutModel copyWith({
    AddressModel? address,
    List<PaymentMethodModel>? paymentMethods,
    String? selectedPaymentId,
    CheckoutStep? currentStep,
  }) {
    return CheckoutModel(
      address: address ?? this.address,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      selectedPaymentId: selectedPaymentId ?? this.selectedPaymentId,
      currentStep: currentStep ?? this.currentStep,
    );
  }

  @override
  List<Object?> get props => [address, paymentMethods, selectedPaymentId, currentStep];
}