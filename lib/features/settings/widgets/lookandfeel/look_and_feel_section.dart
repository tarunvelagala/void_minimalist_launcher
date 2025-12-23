import 'package:flutter/material.dart';
import 'package:return_zero/features/settings/widgets/lookandfeel/widgets/theme_mode_widget.dart';
import 'package:return_zero/features/settings/widgets/settings_section.dart';

class LookAndFeelSection extends StatelessWidget {
  const LookAndFeelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(title: 'Look & Feel', children: [ThemeModeWidget()]);
  }
}
