import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? isPassword;
  final double? width;
  final validator;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.isPassword,
    this.validator,

    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 350.w,
      child: TextFormField(
        controller: controller,
        validator: validator,
        cursorColor: context.appTheme.primary,
        obscureText: isPassword ?? false,
        autofocus: false,
        style: TextStyle(color: context.appTheme.textPrimary, fontSize: 16.sp),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: context.appTheme.textSecondary,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: TextStyle(color: context.appTheme.textSecondary),
          labelText: labelText ?? '',
          hintText: hintText ?? '',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: context.appTheme.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: context.appTheme.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: context.appTheme.primary),
          ),
          filled: true,
          fillColor: context.appTheme.inputFill,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
