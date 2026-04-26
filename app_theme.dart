import 'package:flutter/material.dart';
import 'package:nti_final_project/core/styling/app_colors.dart';
import 'package:nti_final_project/core/styling/app_fonts.dart';
import 'package:nti_final_project/core/styling/app_styles.dart';

class AppTheme {
  static final ligthTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.mainFontName,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryLineStyle,
      titleMedium: AppStyles.subtitlesStyles,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor,
    )
  );
}
