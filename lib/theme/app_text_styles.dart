import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontSpaceMono = 'SpaceMono';
  static const String fontDarkerGrotesque = 'DarkerGrotesque';

  // Time / Large Numbers
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontSpaceMono,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -1.0,
    height: 1.0,
  );

  // Date / Section Headers
  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontSpaceMono,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.0,
  );

  // Stats Labels
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontDarkerGrotesque,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.0,
  );

  // Stats Values (Highlighted)
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontSpaceMono,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.0,
  );

  // Dynamic Status / Body
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontDarkerGrotesque,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontStyle: FontStyle.italic,
    height: 1.0,
  );
}
