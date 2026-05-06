import 'package:flutter/material.dart';
import 'package:nti_final_project/core/theme/app_theme_extension.dart';

extension ContextThemeExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  ColorScheme get colors => Theme.of(this).colorScheme;

  AppThemeExtension get appTheme =>
      Theme.of(this).extension<AppThemeExtension>() ?? AppThemeExtension.light;

  TextTheme get textStyles => Theme.of(this).textTheme;
}
