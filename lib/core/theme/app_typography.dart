import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppTypography {
  static const double defaultScaleFactor = 1.0;

  static double _scale(
    BuildContext context,
    double baseSize,
    double scaleFactor,
  ) {
    final adaptiveScale = ResponsiveValue<double>(
      context,
      defaultValue: 1.0,
      conditionalValues: const [
        Condition.equals(name: MOBILE, value: 1.0),
        Condition.equals(name: TABLET, value: 1.1),
        Condition.largerThan(name: TABLET, value: 1.2),
      ],
    ).value;

    return baseSize * adaptiveScale * scaleFactor;
  }

  static TextStyle displayLarge(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 57, scaleFactor),
    fontWeight: FontWeight.w800,
    height: 1.12,
    letterSpacing: -0.25,
  );

  static TextStyle displayMedium(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 45, scaleFactor),
    fontWeight: FontWeight.w700,
    height: 1.16,
    letterSpacing: 0,
  );

  static TextStyle displaySmall(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 36, scaleFactor),
    fontWeight: FontWeight.w700,
    height: 1.22,
    letterSpacing: 0,
  );

  static TextStyle headlineLarge(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 32, scaleFactor),
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle headlineMedium(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 28, scaleFactor),
    fontWeight: FontWeight.w600,
    height: 1.29,
    letterSpacing: 0,
  );

  static TextStyle headlineSmall(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 24, scaleFactor),
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0,
  );

  static TextStyle titleLarge(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 22, scaleFactor),
    fontWeight: FontWeight.w500,
    height: 1.27,
    letterSpacing: 0,
  );

  static TextStyle titleMedium(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 16, scaleFactor),
    fontWeight: FontWeight.w400, // Reduced from w500 to look less bold
    height: 1.5,
    letterSpacing: 0.15,
  );

  static TextStyle titleSmall(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 14, scaleFactor),
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static TextStyle bodyLarge(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 16, scaleFactor),
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static TextStyle bodyMedium(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 14, scaleFactor),
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  );

  static TextStyle bodySmall(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 12, scaleFactor),
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static TextStyle labelLarge(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 14, scaleFactor),
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 12, scaleFactor),
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
  );

  static TextStyle labelSmall(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 11, scaleFactor),
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
  );

  static TextStyle timeDisplay(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 48, scaleFactor),
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: 0.5,
  );

  static TextStyle dateDisplay(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 24, scaleFactor),
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: 0.5,
  );

  static TextStyle meridianDisplay(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 16, scaleFactor),
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: 0.5,
  );

  static TextStyle statValue(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 16, scaleFactor),
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: 0.5,
  );

  static TextStyle statLabel(
    BuildContext context, {
    required double scaleFactor,
  }) => TextStyle(
    fontSize: _scale(context, 8, scaleFactor),
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: 0.5,
  );

  static TextTheme textTheme(
    BuildContext context, {
    required double scaleFactor,
  }) => TextTheme(
    displayLarge: displayLarge(context, scaleFactor: scaleFactor),
    displayMedium: displayMedium(context, scaleFactor: scaleFactor),
    displaySmall: displaySmall(context, scaleFactor: scaleFactor),
    headlineLarge: headlineLarge(context, scaleFactor: scaleFactor),
    headlineMedium: headlineMedium(context, scaleFactor: scaleFactor),
    headlineSmall: headlineSmall(context, scaleFactor: scaleFactor),
    titleLarge: titleLarge(context, scaleFactor: scaleFactor),
    titleMedium: titleMedium(context, scaleFactor: scaleFactor),
    titleSmall: titleSmall(context, scaleFactor: scaleFactor),
    bodyLarge: bodyLarge(context, scaleFactor: scaleFactor),
    bodyMedium: bodyMedium(context, scaleFactor: scaleFactor),
    bodySmall: bodySmall(context, scaleFactor: scaleFactor),
    labelLarge: labelLarge(context, scaleFactor: scaleFactor),
    labelMedium: labelMedium(context, scaleFactor: scaleFactor),
    labelSmall: labelSmall(context, scaleFactor: scaleFactor),
  );
}
