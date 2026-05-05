import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'glass_card_widget.dart';
class SplashContent extends StatelessWidget {
  final AnimationController scaleCtrl;
  final AnimationController fadeCtrl;

  const SplashContent({
    super.key,
    required this.scaleCtrl,
    required this.fadeCtrl,
  });

  @override
  Widget build(BuildContext context) {
    final scale = CurvedAnimation(
      parent: scaleCtrl,
      curve: Curves.elasticOut,
    );

    final fade = CurvedAnimation(
      parent: fadeCtrl,
      curve: Curves.easeIn,
    );

    return Center(
      child: ScaleTransition(
        scale: scale,
        child: GlassCard(
          child: FadeTransition(
            opacity: fade,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.textWhite,
                  ),
                  child: Icon(
                    Icons.diamond_rounded,
                    color: AppColors.primaryDark,
                    size: 40.sp,
                  ),
                ),
                SizedBox(height: 16.h),

                Text(
                  'Luxe',
                  style: AppTextStyles.displayLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  'ELEGANCE REIMAGINED',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.tag.copyWith(
                    color: Colors.white70,
                    letterSpacing: 2,
                  ),
                ),

              ],

            ),

          ),
        ),
      ),
    );
  }
}