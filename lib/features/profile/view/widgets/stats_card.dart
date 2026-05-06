// ============================================
// lib/features/profile/view/widgets/stats_card.dart
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/context_theme_extension.dart';
import '../../../../core/theme/app_text_styles.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const StatsCard({
    super.key,
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFF4D41DF),
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: context.appTheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: context.appTheme.shadow,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: context.appTheme.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              value,
              style: AppTextStyles.headlineMedium.copyWith(
                color: valueColor,
                fontWeight: FontWeight.w400,

              ),
            ),
          ],
        ),
      ),
    );
  }
}