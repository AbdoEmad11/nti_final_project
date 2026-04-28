import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/cart_model.dart';
import '../cart_widgets/summary_row_widget.dart';

class CheckoutSummary extends StatelessWidget {
  final CartSummaryModel summary;

  const CheckoutSummary({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: AppTextStyles.headlineSmall,
        ),
        SizedBox(height: 20.h),
        SummaryRowWidget(
          label: 'Subtotal',
          value: '\$${summary.subtotal.toStringAsFixed(2)}',
        ),
        SizedBox(height: 12.h),
        SummaryRowWidget(
          label: 'Shipping',
          value: summary.isFreeShipping ? 'Free' : '\$${summary.shippingCost.toStringAsFixed(2)}',
          valueColor: summary.isFreeShipping ? AppColors.success : null,
        ),
        SizedBox(height: 12.h),
        SummaryRowWidget(
          label: 'Tax (VAT)',
          value: '\$${summary.tax.toStringAsFixed(2)}',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Divider(
            color: AppColors.border,
            thickness: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: AppTextStyles.headlineSmall.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '\$${summary.total.toStringAsFixed(2)}',
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
                fontSize: 22.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}