import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/checkout_model.dart';


class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback? onChange;

  const AddressCard({
    super.key,
    required this.address,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Address',
              style: AppTextStyles.headlineSmall,
            ),
            GestureDetector(
              onTap: onChange,
              child: Text(
                'Change',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // Address Card
        Container(
          padding: EdgeInsets.all(16.r),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location Icon
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: context.appTheme.softPrimary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              // Address Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      style: AppTextStyles.titleLarge,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      address.formattedAddress,
                      style: AppTextStyles.bodyMedium.copyWith(
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      address.phone,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: context.appTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}