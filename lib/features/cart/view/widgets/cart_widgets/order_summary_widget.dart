import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';
import 'package:nti_final_project/features/cart/view/widgets/cart_widgets/summary_row_widget.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_buttons.dart';
import '../../../data/models/cart_model.dart';

class OrderSummaryWidget extends StatelessWidget {
  final CartSummaryModel summary;
  final bool showCheckoutButton;
  final VoidCallback? onCheckout;

  const OrderSummaryWidget({
    super.key,
    required this.summary,
    this.showCheckoutButton = true,
    this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: context.appTheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: context.appTheme.shadow,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
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
            label: 'Tax (${(summary.taxRate * 100).toInt()}%)',
            value: '\$${summary.tax.toStringAsFixed(2)}',
          ),
          SizedBox(height: 12.h),

          SummaryRowWidget(
            label: 'Shipping',
            value: summary.isFreeShipping
                ? 'Free'
                : '\$${summary.shippingCost.toStringAsFixed(2)}',
            valueColor: summary.isFreeShipping ? context.appTheme.primary : null,
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Divider(
              color: context.appTheme.border,
              thickness: 1,
            ),
          ),

          SummaryRowWidget(
            label: 'Total',
            value: '\$${summary.total.toStringAsFixed(2)}',
            isTotal: true,
          ),

          SizedBox(height: 20.h),

          if (showCheckoutButton)
            AppButton(
              label: 'Proceed to Checkout',
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 25.sp,
              ),
              onTap: onCheckout,
            ),
        ],
      ),
    );
  }
}