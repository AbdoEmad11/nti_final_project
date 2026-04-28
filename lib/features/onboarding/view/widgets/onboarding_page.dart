// ============================================
// lib/features/onboarding/view/widgets/onboarding_page.dart
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(32.r),
            child: Image.network(
              data.imageUrl,
              height: 400.h,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 400.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );
              },
              errorBuilder: (_, __, ___) => Container(
                height: 420.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Icon(
                  Icons.image_not_supported_rounded,
                  size: 48.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          // Title
          Text(
            data.title,
            style: AppTextStyles.displayLarge.copyWith(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          // Description
          Text(
            data.description,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}