import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class HomeUsageDisplay extends StatelessWidget {
  const HomeUsageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('42', style: AppTypography.statValue(context)),
            Text('UNLOCKS', style: AppTypography.statLabel(context)),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('12h 1m', style: AppTypography.statValue(context)),
            Text('USAGE', style: AppTypography.statLabel(context)),
          ],
        ),
      ],
    );
  }
}
