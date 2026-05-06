import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_fonts.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';

class AppStyles {
  static TextStyle primaryLineStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 40.sp,
    fontWeight: FontWeight.w900,
    color: AppColors2.primaryColor,
  );

  static TextStyle subtitlesStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: context.appTheme.textSecondary,
    );
  }

  static TextStyle headtitlesStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: context.appTheme.textPrimary,
    );
  }

  static TextStyle labelTextStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: context.appTheme.textPrimary,
    );
  }

  static TextStyle gray16W600Style(BuildContext context) {
    return TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: context.appTheme.textMuted,
    );
  }
}
