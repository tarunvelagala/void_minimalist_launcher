import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class ChangeDefaultLauncher extends StatelessWidget {
  const ChangeDefaultLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
      },
      child: Text(
        'Choose Default Launcher',
        style: AppTypography.bodyLarge(context),
      ),
    );
  }
}
