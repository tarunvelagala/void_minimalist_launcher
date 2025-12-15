import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/core/config/providers/theme_settings_provider.dart';
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';
import 'package:return_zero/features/settings/presentation/widgets/text_size_slider.dart';

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
            builder: (context, themeSettings, child) {
              return TextSizeSlider(
                value: themeSettings.textScaleFactor,
                onChanged: (value) {
                  themeSettings.setTextScaleFactor(value);
                },
              );
            },
          ),
          // Home Screen Alignment Section
          Consumer<HomeSettingsProvider>(
            builder: (context, settings, child) {
              return Column(
                children: [
                  const ListTile(
                    title: Text('Home Screen Alignment'),
                    subtitle: Text(
                      'Choose how widgets are aligned on the home screen',
                    ),
                  ),
                  RadioGroup<CrossAxisAlignment>(
                    groupValue: settings.alignment,
                    onChanged: (value) {
                      if (value != null) {
                        settings.setAlignment(value);
                      }
                    },
                    child: Column(
                      children: [
                        RadioListTile<CrossAxisAlignment>(
                          title: const Text('Left'),
                          value: CrossAxisAlignment.start,
                        ),
                        RadioListTile<CrossAxisAlignment>(
                          title: const Text('Center'),
                          value: CrossAxisAlignment.center,
                        ),
                        RadioListTile<CrossAxisAlignment>(
                          title: const Text('Right'),
                          value: CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
