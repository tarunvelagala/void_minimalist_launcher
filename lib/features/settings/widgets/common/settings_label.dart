import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class SettingsLabel extends StatelessWidget {
  final String label;
  const SettingsLabel(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTypography.titleMedium(
        context,
        scaleFactor: AppTypography.defaultScaleFactor,
      ),
    );
  }
}