import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFFF5F3FF);
  static const Color primaryDark = Color(0xFF4E31AA);

  // Background
  static const Color bgLight = Color(0xFFFAFAFA);
  static const Color bgDark = Color(0xFF121212);

  // Surface
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Text
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Status
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  // Accent
  static const Color accent = Color(0xFFFF6584);

  // Border
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF2D2D2D);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF3B35CC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient splashGradient = LinearGradient(
    colors: [
      Color(0xFF1A1A2E),
      Color(0xFF1A1A2E),
      Color(0xFF4E31AA),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}