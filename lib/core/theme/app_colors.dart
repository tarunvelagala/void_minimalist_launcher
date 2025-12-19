import 'package:flutter/material.dart';

class AppColors {
  // Pure Monochrome
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // Dark Theme
  static const Color darkBackground = black;
  static const Color darkPrimary = white;
  static const Color darkSecondary = Color(
    0xFFB0B0B0,
  ); // Light gray for secondary text
  static const Color darkSurface = black;
  static const Color darkOnSurface = white;

  // Light Theme
  static const Color lightBackground = white;
  static const Color lightPrimary = black;
  static const Color lightSecondary = Color(
    0xFF4A4A4A,
  ); // Dark gray for secondary text
  static const Color lightSurface = white;
  static const Color lightOnSurface = black;
}
