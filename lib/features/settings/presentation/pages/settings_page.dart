import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/core/config/providers/theme_settings_provider.dart';
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';
import 'package:return_zero/features/settings/presentation/widgets/app_alignment_setting.dart';
import 'package:return_zero/features/settings/presentation/widgets/text_size_setting.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Text Size Section
          Consumer<ThemeSettingsProvider>(
            builder: (context, theme, _) => TextSizeSetting(
              currentFactor: theme.textScaleFactor,
              onSelectionChanged: theme.setTextScaleFactor,
            ),
          ),

          // Home Screen Alignment Section
          Consumer<HomeSettingsProvider>(
            builder: (context, settings, child) {
              return AppAlignmentSetting(
                currentAlignment: settings.alignment,
                onSelectionChanged: settings.setAlignment,
              );
            },
          ),
        ],
      ),
    );
  }
}
