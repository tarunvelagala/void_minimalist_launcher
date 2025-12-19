import 'package:flutter/material.dart';
import 'app_typography.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightOnSurface,
    ),
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColors.lightPrimary,
      displayColor: AppColors.lightPrimary,
    ),
    useMaterial3: true,
  );

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkOnSurface,
    ),
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColors.darkPrimary,
      displayColor: AppColors.darkPrimary,
    ),
    useMaterial3: true,
  );
}
