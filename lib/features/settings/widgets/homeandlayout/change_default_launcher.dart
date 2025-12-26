import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:return_zero/features/settings/widgets/common/settings_label.dart';

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
      child: SettingsLabel('Change Default Launcher')
    );
  }
}
