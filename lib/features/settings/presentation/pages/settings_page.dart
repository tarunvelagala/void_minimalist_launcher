import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<HomeSettingsProvider>(
        builder: (context, settings, child) {
          return ListView(
            children: [
               ListTile(
                title: const Text('Home Screen Alignment'),
                subtitle: const Text('Choose how widgets are aligned on the home screen'),
              ),
              RadioListTile<CrossAxisAlignment>(
                title: const Text('Left'),
                value: CrossAxisAlignment.start,
                groupValue: settings.alignment,
                onChanged: (value) {
                  if (value != null) {
                    settings.setAlignment(value);
                  }
                },
              ),
              RadioListTile<CrossAxisAlignment>(
                title: const Text('Center'),
                value: CrossAxisAlignment.center,
                groupValue: settings.alignment,
                onChanged: (value) {
                  if (value != null) {
                    settings.setAlignment(value);
                  }
                },
              ),
              RadioListTile<CrossAxisAlignment>(
                title: const Text('Right'),
                value: CrossAxisAlignment.end,
                groupValue: settings.alignment,
                onChanged: (value) {
                  if (value != null) {
                    settings.setAlignment(value);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
