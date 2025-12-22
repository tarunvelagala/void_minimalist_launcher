import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';
import 'package:return_zero/features/settings/widgets/settings_section.dart';

class ControlsSection extends StatelessWidget {
  const ControlsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'Controls',
      children: [
        Text('Swipe Left App', style: AppTypography.titleMedium(context)),
        Text('Swipe Right App', style: AppTypography.titleMedium(context)),
        Text('Double tap to lock', style: AppTypography.titleMedium(context)),
      ],
    );
  }
}
