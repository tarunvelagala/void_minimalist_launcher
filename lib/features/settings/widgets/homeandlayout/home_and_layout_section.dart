import 'package:flutter/material.dart';
import 'package:return_zero/features/settings/widgets/common/settings_section.dart';
import 'package:return_zero/features/settings/widgets/homeandlayout/app_alignment.dart';
import 'package:return_zero/features/settings/widgets/homeandlayout/change_default_launcher.dart';

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
