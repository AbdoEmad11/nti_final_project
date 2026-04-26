import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;

  const PrimaryButtonWidget(
      {
    super.key,
    this.fontSize, 
    this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors2.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 12.r),
        ),
        fixedSize: Size(width ?? 300.w, height ?? 56.h)
      ),
      onPressed: onPressed,
      child: Text(buttonText ?? '', style: TextStyle(color: textColor,fontSize: fontSize ?? 16.sp )),
    );
  }
}
