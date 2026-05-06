import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final bool isLoading;
  final void Function()? onPressed;

  const PrimaryButtonWidget({
    super.key,
    this.fontSize,
    this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors2.primaryColor,
        disabledBackgroundColor:
        (buttonColor ?? AppColors2.primaryColor).withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        fixedSize: Size(width ?? 350.w, height ?? 56.h),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
        width: 22.w,
        height: 22.w,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      )
          : Text(
        buttonText ?? '',
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}