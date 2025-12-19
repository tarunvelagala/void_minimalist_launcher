import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class HomeUsageDisplay extends StatelessWidget {
  const HomeUsageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Screen Usage", style: AppTypography.titleMedium(context)),
        Text("Unlocks", style: AppTypography.titleMedium(context)),
      ],
    );
  }
}
