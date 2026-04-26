import 'package:flutter/material.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_fonts.dart';
import 'package:nti_final_project/core/styling/app_styles.dart';

class AppTheme {
  static final ligthTheme = ThemeData(
    primaryColor: AppColors2.primaryColor,
    scaffoldBackgroundColor: AppColors2.whiteColor,
    fontFamily: AppFonts.mainFontName,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryLineStyle,
      titleMedium: AppStyles.subtitlesStyles,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors2.primaryColor,
      disabledColor: AppColors2.secondaryColor,
    )
  );
}
