import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/core/theme/app_typography.dart';
import 'package:return_zero/features/home/widgets/settings/change_default_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          Text('About', style: AppTypography.headlineSmall(context)),
          ChangeDefaultLauncher(),
        ],
      ),
    );
  }
}
