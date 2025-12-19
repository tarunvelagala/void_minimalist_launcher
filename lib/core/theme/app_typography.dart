import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppTypography {
  /// The global font size scale factor (0-7).
  /// For now, we default to 1.0 (Middle/Normal).
  /// In the future, this will be tied to a provider.
  static double get scaleFactor => 1.0;

  static double _scale(BuildContext context, double baseSize) {
    // Basic adaptive scaling
    final adaptiveScale = ResponsiveValue<double>(
      context,
      conditionalValues: [
        const Condition.equals(name: MOBILE, value: 1.0),
        const Condition.equals(name: TABLET, value: 1.15),
        const Condition.largerThan(name: TABLET, value: 1.3),
      ],
    ).value;

    return baseSize * adaptiveScale * scaleFactor;
  }

  static TextStyle displayLarge(BuildContext context) => TextStyle(
    fontSize: _scale(context, 57),
    fontWeight: FontWeight.w800,
    height: 1.12,
    letterSpacing: -0.25,
  );

  static TextStyle displayMedium(BuildContext context) => TextStyle(
    fontSize: _scale(context, 45),
    fontWeight: FontWeight.w700,
    height: 1.16,
    letterSpacing: 0,
  );

  static TextStyle displaySmall(BuildContext context) => TextStyle(
    fontSize: _scale(context, 36),
    fontWeight: FontWeight.w700,
    height: 1.22,
    letterSpacing: 0,
  );

  static TextStyle headlineLarge(BuildContext context) => TextStyle(
    fontSize: _scale(context, 32),
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle headlineMedium(BuildContext context) => TextStyle(
    fontSize: _scale(context, 28),
    fontWeight: FontWeight.w600,
    height: 1.29,
    letterSpacing: 0,
  );

  static TextStyle headlineSmall(BuildContext context) => TextStyle(
    fontSize: _scale(context, 24),
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0,
  );

  static TextStyle titleLarge(BuildContext context) => TextStyle(
    fontSize: _scale(context, 22),
    fontWeight: FontWeight.w500,
    height: 1.27,
    letterSpacing: 0,
  );

  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontSize: _scale(context, 16),
    fontWeight: FontWeight.w400, // Reduced from w500 to look less bold
    height: 1.5,
    letterSpacing: 0.15,
  );

  static TextStyle titleSmall(BuildContext context) => TextStyle(
    fontSize: _scale(context, 14),
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontSize: _scale(context, 16),
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static TextStyle bodyMedium(BuildContext context) => TextStyle(
    fontSize: _scale(context, 14),
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  );

  static TextStyle bodySmall(BuildContext context) => TextStyle(
    fontSize: _scale(context, 12),
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static TextStyle labelLarge(BuildContext context) => TextStyle(
    fontSize: _scale(context, 14),
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium(BuildContext context) => TextStyle(
    fontSize: _scale(context, 12),
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
  );

  static TextStyle labelSmall(BuildContext context) => TextStyle(
    fontSize: _scale(context, 11),
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
  );

  static TextTheme textTheme(BuildContext context) => TextTheme(
    displayLarge: displayLarge(context),
    displayMedium: displayMedium(context),
    displaySmall: displaySmall(context),
    headlineLarge: headlineLarge(context),
    headlineMedium: headlineMedium(context),
    headlineSmall: headlineSmall(context),
    titleLarge: titleLarge(context),
    titleMedium: titleMedium(context),
    titleSmall: titleSmall(context),
    bodyLarge: bodyLarge(context),
    bodyMedium: bodyMedium(context),
    bodySmall: bodySmall(context),
    labelLarge: labelLarge(context),
    labelMedium: labelMedium(context),
    labelSmall: labelSmall(context),
  );
}
