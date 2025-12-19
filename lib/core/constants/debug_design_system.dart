import 'package:flutter/material.dart';

class AppTypography {
  static const String fontSans = 'DarkerGrotesque';
  static const String fontMono = 'SpaceMono';

  // --- Sans-Serif (Darker Grotesque) ---

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontSans,
    fontSize: 96,
    fontWeight: FontWeight.w800, // ExtraBold
    height: 1.0,
    letterSpacing: -1.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontSans,
    fontSize: 60,
    fontWeight: FontWeight.w700, // Bold
    height: 1.0,
    letterSpacing: -0.5,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontSans,
    fontSize: 48,
    fontWeight: FontWeight.w700, // Bold
    height: 1.1,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontSans,
    fontSize: 40,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.1,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontSans,
    fontSize: 32,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.2,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontSans,
    fontSize: 24,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.2,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontSans,
    fontSize: 20,
    fontWeight: FontWeight.w500, // Medium
    height: 1.25,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontSans,
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    height: 1.2,
    letterSpacing: 0.15,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontSans,
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    height: 1.4,
    letterSpacing: 0.1,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontSans,
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    height: 1.5,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontSans,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
    height: 1.5,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontSans,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 1.4,
    letterSpacing: 0.4,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontSans,
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    height: 1.4,
    letterSpacing: 1.25,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontSans,
    fontSize: 12,
    fontWeight: FontWeight.w500, // Medium
    height: 1.3,
    letterSpacing: 1.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontSans,
    fontSize: 10,
    fontWeight: FontWeight.w400, // Regular
    height: 1.5,
    letterSpacing: 1.5,
  );

  // --- Monospace (Space Mono) ---

  static const TextStyle monoDisplay = TextStyle(
    fontFamily: fontMono,
    fontSize: 72,
    fontWeight: FontWeight.w700, // Bold
    height: 1.0,
  );

  static const TextStyle monoBody = TextStyle(
    fontFamily: fontMono,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
    height: 1.5,
  );

  static const TextStyle monoLabel = TextStyle(
    fontFamily: fontMono,
    fontSize: 12,
    fontWeight: FontWeight.w700, // Bold
    height: 1.0,
    letterSpacing: 1.0,
  );

  // --- Combined / Component Styles ---

  /// Style for large clock display
  static const TextStyle clockPrimary = monoDisplay;

  /// Style for clock suffix (AM/PM)
  static const TextStyle clockSuffix = TextStyle(
    fontFamily: fontSans,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.0,
  );

  /// Style for primary stat value
  static const TextStyle statValue = TextStyle(
    fontFamily: fontMono,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.0,
  );

  /// Style for stat labels
  static const TextStyle statLabel = labelSmall;

  /// Style for date display (e.g., "Fri, 19 Dec")
  static const TextStyle dateStyle = TextStyle(
    fontFamily: fontSans,
    fontSize: 32,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.2,
    letterSpacing: 0.2,
  );

  // --- Rich Text Helpers ---

  /// Creates a [TextSpan] that combines Sans and Mono fonts.
  /// Useful for inline code or technical labels within sentences.
  static TextSpan combined({
    required String text,
    required String monoPart,
    TextStyle? baseStyle,
    TextStyle? monoStyle,
  }) {
    final style = baseStyle ?? bodyMedium;
    final mStyle = monoStyle ?? monoBody.copyWith(color: style.color);

    return TextSpan(
      style: style,
      children: [
        TextSpan(text: text),
        TextSpan(text: monoPart, style: mStyle),
      ],
    );
  }

  // --- Theme Integration Helper ---

  static TextTheme get textTheme => const TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );
}
