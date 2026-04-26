import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle displayLarge = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle headlineLarge = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineSmall = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle titleLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle labelLarge = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static TextStyle price = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
  );

  static TextStyle tag = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
    color: AppColors.textSecondary,
  );
}