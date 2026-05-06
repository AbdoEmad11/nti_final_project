import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SummaryRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;
  final Color? valueColor;

  const SummaryRowWidget({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.titleLarge.copyWith(
            fontSize: 24.sp,
          )
              : AppTextStyles.bodyMedium,
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyles.headlineLarge.copyWith(
            color: context.appTheme.primary,
            fontWeight: FontWeight.w800,
          )
              : AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor ?? context.appTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}