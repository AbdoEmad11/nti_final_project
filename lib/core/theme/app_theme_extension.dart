import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color primary;
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color border;
  final Color inputFill;
  final Color softPrimary;
  final Color success;
  final Color error;
  final Color warning;
  final Color shadow;

  const AppThemeExtension({
    required this.primary,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.inputFill,
    required this.softPrimary,
    required this.success,
    required this.error,
    required this.warning,
    required this.shadow,
  });

  static const light = AppThemeExtension(
    primary: Color(0xFF4D41DF),
    background: Color(0xFFFAFAFA),
    surface: Color(0xFFFFFFFF),
    surfaceVariant: Color(0xFFF7F8F9),
    textPrimary: Color(0xFF1A1B22),
    textSecondary: Color(0xFF6B7280),
    textMuted: Color(0xFF9CA3AF),
    border: Color(0xFFE5E7EB),
    inputFill: Color(0xFFF7F8F9),
    softPrimary: Color(0xFFF5F3FF),
    success: Color(0xFF10B981),
    error: Color(0xFFEF4444),
    warning: Color(0xFFF59E0B),
    shadow: Color(0x14000000),
  );

  static const dark = AppThemeExtension(
    primary: Color(0xFF4D41DF),
    background: Color(0xFF0F1014),
    surface: Color(0xFF1A1B22),
    surfaceVariant: Color(0xFF242632),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFD1D5DB),
    textMuted: Color(0xFF9CA3AF),
    border: Color(0xFF2D2F3A),
    inputFill: Color(0xFF1E202A),
    softPrimary: Color(0xFF25234A),
    success: Color(0xFF22C55E),
    error: Color(0xFFF87171),
    warning: Color(0xFFFBBF24),
    shadow: Color(0x26000000),
  );

  @override
  AppThemeExtension copyWith({
    Color? primary,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? border,
    Color? inputFill,
    Color? softPrimary,
    Color? success,
    Color? error,
    Color? warning,
    Color? shadow,
  }) {
    return AppThemeExtension(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
      inputFill: inputFill ?? this.inputFill,
      softPrimary: softPrimary ?? this.softPrimary,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      surfaceVariant:
          Color.lerp(surfaceVariant, other.surfaceVariant, t) ?? surfaceVariant,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      textMuted: Color.lerp(textMuted, other.textMuted, t) ?? textMuted,
      border: Color.lerp(border, other.border, t) ?? border,
      inputFill: Color.lerp(inputFill, other.inputFill, t) ?? inputFill,
      softPrimary: Color.lerp(softPrimary, other.softPrimary, t) ?? softPrimary,
      success: Color.lerp(success, other.success, t) ?? success,
      error: Color.lerp(error, other.error, t) ?? error,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      shadow: Color.lerp(shadow, other.shadow, t) ?? shadow,
    );
  }
}
