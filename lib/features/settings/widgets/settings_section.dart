import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: AppLayout.elementSpacing(context),
      children: [
        Text(title, style: AppTypography.headlineSmall(context)),
        ...children,
      ],
    );
  }
}
