import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class ControlsSection extends StatelessWidget {
  const ControlsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: AppLayout.contentPadding(context),
        children: [
          Text('Controls', style: AppTypography.headlineSmall(context)),
          Text('Swipe Left App', style: AppTypography.bodyLarge(context)),
          Text('Swipe Right App', style: AppTypography.bodyLarge(context)),
          Text('Double tap to lock', style: AppTypography.bodyLarge(context)),
        ],
      ),
    );
  }
}
