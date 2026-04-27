import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? isPassword;
  final double? width;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.isPassword,

    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300.w,
      child: TextField(
        cursorColor: AppColors2.primaryColor,
        obscureText: isPassword ?? false,
        autofocus: false,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: Color(0xff6B7280),
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText ?? '',
          hintText: hintText ?? '',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors2.grayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors2.primaryColor),
          ),
          filled: true,
          fillColor: Color(0xffF4F2FC),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
