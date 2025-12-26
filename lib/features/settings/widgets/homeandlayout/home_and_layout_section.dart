import 'package:flutter/material.dart';
import 'package:return_zero/features/settings/widgets/homeandlayout/widgets/app_alignment.dart';
import 'package:return_zero/features/settings/widgets/homeandlayout/widgets/change_default_launcher.dart';
import 'package:return_zero/features/settings/widgets/settings_section.dart';

class HomeAndLayoutSection extends StatelessWidget {
  const HomeAndLayoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'Home & Layout',
      children: [ChangeDefaultLauncher(), AppAlignment()],
    );
  }
}
