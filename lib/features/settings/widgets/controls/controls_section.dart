import 'package:flutter/material.dart';
import 'package:return_zero/features/settings/widgets/common/settings_label.dart';
import 'package:return_zero/features/settings/widgets/common/settings_section.dart';

class ControlsSection extends StatelessWidget {
  const ControlsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'Controls',
      children: [
        SettingsLabel('Gesture Controls'),
        SettingsLabel('Swipe Right App'),
        SettingsLabel('Double tap to lock'),
      ],
    );
  }
}
