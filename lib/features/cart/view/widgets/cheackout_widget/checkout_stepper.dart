import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/checkout_model.dart';

class CheckoutStepper extends StatelessWidget {
  final CheckoutStep currentStep;

  const CheckoutStepper({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        children: [
          _buildStep(
            context: context,
            number: 1,
            label: 'Shipping',
            isActive: currentStep == CheckoutStep.shipping,
          ),
          _buildConnector(context: context, isActive: currentStep.index >= 1),
          _buildStep(
            context: context,
            number: 2,
            label: 'Payment',
            isActive: currentStep == CheckoutStep.payment,
          ),
          _buildConnector(context: context, isActive: currentStep.index >= 2),
          _buildStep(
            context: context,
            number: 3,
            label: 'Review',
            isActive: currentStep == CheckoutStep.review,
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required BuildContext context,
    required int number,
    required String label,
    required bool isActive,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive ? AppColors.primary : context.appTheme.border,
                width: 2,
              ),
            ),
            child: Center(
              child: isActive && number < 3
                  ? Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 18.sp,
              )
                  : Text(
                '$number',
                style: AppTextStyles.titleMedium.copyWith(
                  color: isActive ? AppColors.primary : context.appTheme.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: isActive ? AppColors.primary : context.appTheme.textSecondary,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnector({required BuildContext context, required bool isActive}) {
    return Container(
      width: 40.w,
      height: 2,
      margin: EdgeInsets.only(bottom: 28.h),
      color: isActive ? AppColors.primary : context.appTheme.border,
    );
  }
}