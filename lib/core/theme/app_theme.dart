import 'package:flutter/material.dart';
import 'app_typography.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData light(BuildContext context) =>
      _theme(context, Brightness.light);
  static ThemeData dark(BuildContext context) =>
      _theme(context, Brightness.dark);

  static ThemeData _theme(BuildContext context, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: brightness,
        primary: primary,
        secondary: isDark ? AppColors.darkSecondary : AppColors.lightSecondary,
        surface: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        onSurface: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
      ),
      textTheme: AppTypography.textTheme(
        context,
        scaleFactor: AppTypography.defaultScaleFactor,
      ).apply(bodyColor: primary, displayColor: primary),
      useMaterial3: true,
    );
  }

  // Legacy getters (will be used by MaterialApp, but builder will override if needed)
  static ThemeData get lightTheme =>
      ThemeData(brightness: Brightness.light, useMaterial3: true);
  static ThemeData get darkTheme =>
      ThemeData(brightness: Brightness.dark, useMaterial3: true);
}
