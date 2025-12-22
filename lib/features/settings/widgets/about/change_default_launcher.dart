import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class ChangeDefaultLauncher extends StatelessWidget {
  const ChangeDefaultLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        HapticFeedback.selectionClick();
        const intent = AndroidIntent(
          action: 'android.settings.MANAGE_DEFAULT_APPS_SETTINGS',
        );
        await intent.launch();
      },
      child: Text(
        'Choose Default Launcher',
        style: AppTypography.titleMedium(
          context,
          scaleFactor: AppTypography.defaultScaleFactor,
        ),
      ),
    );
  }
}
