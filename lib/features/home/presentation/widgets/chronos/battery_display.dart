import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';

class BatteryDisplay extends StatelessWidget {
  final int level;
  const BatteryDisplay({super.key, required this.level});

  Future<void> _openBatterySettings() async {
    // Standard Android intent for battery settings
    await InstalledApps.startApp("com.google.android.calendar");
    // Note: To go directly to Battery, a custom Intent plugin is usually required,
    // but opening Settings is the standard fallback for MVP.
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openBatterySettings,
      child: Text(
        '$level%',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
      ),
    );
  }
}
