import 'package:flutter/material.dart';
import 'package:nti_final_project/core/styling/app_fonts.dart';
import 'package:nti_final_project/core/theme/app_theme_extension.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppFonts.mainFontName,
    primaryColor: AppThemeExtension.light.primary,
    scaffoldBackgroundColor: AppThemeExtension.light.background,
    cardColor: AppThemeExtension.light.surface,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4D41DF),
      surface: Color(0xFFFFFFFF),
      error: Color(0xFFEF4444),
      onPrimary: Colors.white,
      onSurface: Color(0xFF1A1B22),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFAFAFA),
      foregroundColor: Color(0xFF1A1B22),
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
    ),
    dividerColor: AppThemeExtension.light.border,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppThemeExtension.light.inputFill,
      hintStyle: const TextStyle(
        color: Color(0xFF6B7280),
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(color: Color(0xFF6B7280)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF4D41DF), width: 1.2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFF4D41DF),
      unselectedItemColor: Color(0xFF9CA3AF),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(Color(0xFF4D41DF)),
      trackOutlineColor: WidgetStatePropertyAll(Color(0xFFE5E7EB)),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF1A1B22)),
      bodyMedium: TextStyle(color: Color(0xFF1A1B22)),
      titleMedium: TextStyle(color: Color(0xFF1A1B22)),
      titleLarge: TextStyle(color: Color(0xFF1A1B22)),
      headlineMedium: TextStyle(color: Color(0xFF1A1B22)),
      headlineSmall: TextStyle(color: Color(0xFF1A1B22)),
    ),
    extensions: const [AppThemeExtension.light],
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppFonts.mainFontName,
    primaryColor: AppThemeExtension.dark.primary,
    scaffoldBackgroundColor: AppThemeExtension.dark.background,
    cardColor: AppThemeExtension.dark.surface,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF4D41DF),
      surface: Color(0xFF1A1B22),
      error: Color(0xFFF87171),
      onPrimary: Colors.white,
      onSurface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0F1014),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
    ),
    dividerColor: AppThemeExtension.dark.border,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppThemeExtension.dark.inputFill,
      hintStyle: const TextStyle(
        color: Color(0xFF9CA3AF),
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(color: Color(0xFFD1D5DB)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF2D2F3A)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF4D41DF), width: 1.2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1A1B22),
      selectedItemColor: Color(0xFF4D41DF),
      unselectedItemColor: Color(0xFF9CA3AF),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(Color(0xFF4D41DF)),
      trackOutlineColor: WidgetStatePropertyAll(Color(0xFF2D2F3A)),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
    ),
    extensions: const [AppThemeExtension.dark],
  );

  // Backward compatibility with existing usage.
  static ThemeData get ligthTheme => lightTheme;
}