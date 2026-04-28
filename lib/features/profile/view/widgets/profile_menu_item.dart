import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/profile_model.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final ProfileMenuItem item;
  final VoidCallback? onTap;

  const ProfileMenuItemWidget({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: item.iconBackgroundColor ?? AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                item.icon,
                color: item.iconColor,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 16.w),
            // Title
            Expanded(
              child: Text(
                item.title,
                style: AppTextStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Arrow
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}