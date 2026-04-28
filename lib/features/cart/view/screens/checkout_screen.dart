import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_test/features/cart/view/widgets/chekout_widgets/checkout_stepper.dart';
import 'package:nti_test/features/cart/view/widgets/chekout_widgets/payment_method_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../data/cubits/checkout_cubit.dart';
import '../../data/cubits/checkout_state.dart';
import '../../data/models/cart_model.dart';
import '../widgets/cart_widgets/order_summary_widget.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckoutCubit(),
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceLight,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.textPrimary,
              size: 20.sp,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Checkout',
            style: AppTextStyles.headlineSmall,
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Center(
                child: Text(
                  AppConstants.appName,
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocConsumer<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutOrderPlaced) {
              _showOrderSuccess(context);
            }
          },
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            if (state is CheckoutLoaded) {
              final checkout = state.checkout;
              final summary = CartSummaryModel(
                subtotal: 1450.00,
                taxRate: 0.20, // 20% VAT as shown in screenshot
                shippingCost: 0.0,
              );

              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Stepper
                            CheckoutStepper(currentStep: checkout.currentStep),
                            SizedBox(height: 8.h),

                            // Delivery Address
                            if (checkout.address != null) ...[
                              AddressCard(
                                address: checkout.address!,
                                onChange: () {
                                  // Navigate to address selection
                                },
                              ),
                              SizedBox(height: 32.h),
                            ],

                            // Payment Methods
                            Text(
                              'Payment Methods',
                              style: AppTextStyles.headlineSmall,
                            ),
                            SizedBox(height: 16.h),
                            ...checkout.paymentMethods.map((payment) {
                              return PaymentMethodCard(
                                payment: payment,
                                isSelected: payment.id == checkout.selectedPaymentId,
                                onTap: () => context.read<CheckoutCubit>().selectPaymentMethod(payment.id),
                              );
                            }),
                            SizedBox(height: 24.h),

                            // Terms Text
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'By placing an order, you agree to our ',
                                      ),
                                      TextSpan(
                                        text: 'Terms and Conditions',
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const TextSpan(text: '.'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),

                            // Order Summary
                            OrderSummaryWidget(
                                showCheckoutButton: false,
                                summary: summary

                            ),
                            SizedBox(height: 100.h),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Place Order Button
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, -4),
                          ),
                        ],
                      ),
                      child: SafeArea(
                        child: AppButton(
                          label: 'Place Order',
                          icon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                          onTap: () => context.read<CheckoutCubit>().placeOrder(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is CheckoutError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 48.sp,
                      color: AppColors.error,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      state.message,
                      style: AppTextStyles.bodyLarge,
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showOrderSuccess(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: const BoxDecoration(
                color: AppColors.success,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Order Placed!',
              style: AppTextStyles.headlineMedium,
            ),
            SizedBox(height: 8.h),
            Text(
              'Your order has been placed successfully.',
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            AppButton(
              label: 'Continue Shopping',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}