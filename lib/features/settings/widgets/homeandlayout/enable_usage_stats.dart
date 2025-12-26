import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';
import 'package:return_zero/features/settings/widgets/common/settings_row.dart';

class EnableUsageStats extends StatelessWidget {
  const EnableUsageStats({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsRow(
      label: 'Enable Usage Stats',
      control: Text(
        'Off',
        style: AppTypography.bodySmall(
          context,
          scaleFactor: AppTypography.defaultScaleFactor,
        ),
      ),
    );
  }
}
