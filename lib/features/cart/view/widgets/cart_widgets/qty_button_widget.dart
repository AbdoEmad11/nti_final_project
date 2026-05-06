import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class QtyButtonWidget extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QtyButtonWidget({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.appTheme.softPrimary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCircularButton(
            context: context,
            icon: Icons.remove_rounded,
            onTap: onDecrement,
            isPrimary: false,
          ),
          // Quantity
          Container(
            constraints: BoxConstraints(minWidth: 32.w),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              '$quantity',
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: context.appTheme.textPrimary,
              ),
            ),
          ),
          _buildCircularButton(
            context: context,
            icon: Icons.add_rounded,
            onTap: onIncrement,
            isPrimary: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 32.w,
          height: 32.w,
          margin: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: isPrimary ? AppColors.primary : context.appTheme.surface,
            shape: BoxShape.circle,
            boxShadow: isPrimary
                ? [
              BoxShadow(
                color: context.appTheme.shadow,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ]
                : null,
          ),
          child: Icon(
            icon,
            size: 16.sp,
            color: isPrimary ? Colors.white : context.appTheme.textPrimary,
          ),
        ),
      ),
    );
  }
}