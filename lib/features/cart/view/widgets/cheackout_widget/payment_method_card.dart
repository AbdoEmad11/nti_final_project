import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/checkout_model.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodModel payment;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.payment,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: _getIconBackground(),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: _buildIcon(),
              ),
            ),
            SizedBox(width: 12.w),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    payment.name,
                    style: AppTextStyles.titleLarge,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    payment.subtitle,
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
            // Radio Button
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconBackground() {
    if (payment.id.contains('visa')) return const Color(0xFFF5F3FF);
    if (payment.id.contains('apple')) return Colors.black;
    if (payment.id.contains('google')) return Colors.white;
    return AppColors.primaryLight;
  }

  Widget _buildIcon() {
    if (payment.id.contains('visa')) {
      return Icon(
        Icons.credit_card_rounded,
        color: AppColors.primary,
        size: 20.sp,
      );
    }
    if (payment.id.contains('apple')) {
      return Text(
        'iOS',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    if (payment.id.contains('google')) {
      return Text(
        'G',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return Icon(
      Icons.payment_rounded,
      color: AppColors.primary,
      size: 20.sp,
    );
  }
}