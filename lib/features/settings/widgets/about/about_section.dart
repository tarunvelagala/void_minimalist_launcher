import 'package:flutter/material.dart';
import 'package:return_zero/features/settings/widgets/about/return_zero_link.dart';
import 'package:return_zero/features/settings/widgets/common/settings_row.dart';
import 'package:return_zero/features/settings/widgets/common/settings_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'Return Zero',
      children: [
        ReturnZeroLink(),
        SettingsRow(label: 'License', control: Text('MIT')),
      ],
    );
  }
}
