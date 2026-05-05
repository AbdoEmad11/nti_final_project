import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_fonts.dart';

class AppStyles {
  static TextStyle primaryLineStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 40.sp,
    fontWeight: FontWeight.w900,
    color: AppColors2.primaryColor,
  );
  static TextStyle subtitlesStyles = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors2.secondaryColor,
  );
  static TextStyle headtitlesStyles = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors2.blackColor,
  );

  static TextStyle labelTextStyles = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors2.blackColor,
  );
  static TextStyle gray16W600Styles = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors2.grayColor,
  );
}
