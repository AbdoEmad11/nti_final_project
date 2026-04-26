import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors.dart';
import 'package:nti_final_project/core/styling/app_fonts.dart';

class AppStyles {
  static TextStyle primaryLineStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor
  );
  static TextStyle subtitlesStyles = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor
  );

  static TextStyle black16W600Styles = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor
  );
  static TextStyle gray16W600Styles = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor
  );
}
