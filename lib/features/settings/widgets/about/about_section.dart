import 'package:flutter/material.dart';
import 'package:return_zero/features/settings/widgets/about/change_default_launcher.dart';
import 'package:return_zero/features/settings/widgets/settings_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(title: 'About', children: [ChangeDefaultLauncher()]);
  }
}
