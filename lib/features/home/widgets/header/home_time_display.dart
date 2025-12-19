import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class HomeTimeDisplay extends StatelessWidget {
  const HomeTimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("12: 40 PM", style: AppTypography.displayLarge);
  }
}
