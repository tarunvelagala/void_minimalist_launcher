import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';
import 'package:return_zero/features/settings/widgets/common/settings_row.dart';

class AppsNumber extends StatelessWidget {
  const AppsNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsRow(
      label: 'Apps on Home Screen',
      control: Text(
        '5',
        style: AppTypography.bodySmall(
          context,
          scaleFactor: AppTypography.defaultScaleFactor,
        ),
      ),
    );
  }
}
