import 'package:flutter/material.dart';
import 'package:return_zero/features/settings/widgets/common/settings_section.dart';
import 'package:return_zero/features/settings/widgets/lookandfeel/apps_number.dart';
import 'package:return_zero/features/settings/widgets/lookandfeel/theme_mode_widget.dart';

class LookAndFeelSection extends StatelessWidget {
  const LookAndFeelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(title: 'Look & Feel', children: [ThemeModeWidget(), AppsNumber()]);
  }
}
