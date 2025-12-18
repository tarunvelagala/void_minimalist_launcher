import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget child;

  const AdaptiveLayout({super.key, required this.child});

  static double getScale(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // Baseline width of 360px (standard mobile)
    return (width / 360).clamp(0.8, 1.5);
  }

  static double scale(BuildContext context, double value) {
    return value * getScale(context);
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
