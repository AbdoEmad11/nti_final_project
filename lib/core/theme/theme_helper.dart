import 'package:flutter/material.dart';

class ThemeHelper {
  ThemeHelper._();

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color scaffold(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  static Color card(BuildContext context) {
    return Theme.of(context).cardColor;
  }

  static Color textPrimary(BuildContext context) {
    return isDark(context) ? Colors.white : const Color(0xff1A1B22);
  }

  static Color textSecondary(BuildContext context) {
    return isDark(context) ? const Color(0xffD1D5DB) : const Color(0xff6B7280);
  }

  static Color softBackground(BuildContext context) {
    return isDark(context) ? const Color(0xff1A1B22) : const Color(0xffF5F3FF);
  }

  static Color border(BuildContext context) {
    return isDark(context) ? const Color(0xff2D2D2D) : const Color(0xffE5E7EB);
  }
}