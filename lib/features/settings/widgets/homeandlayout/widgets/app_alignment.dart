import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class AppAlignment extends StatefulWidget {
  const AppAlignment({super.key});

  @override
  State<AppAlignment> createState() => _AppAlignmentState();
}

class _AppAlignmentState extends State<AppAlignment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'App Alignment',
          style: AppTypography.titleMedium(
            context,
            scaleFactor: AppTypography.defaultScaleFactor,
          ),
        ),
        Text(
          'Center',
          style: AppTypography.bodyMedium(
            context,
            scaleFactor: AppTypography.defaultScaleFactor,
          ),
        ),
      ],
    );
  }
}