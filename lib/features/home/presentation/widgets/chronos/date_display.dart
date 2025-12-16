import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatelessWidget {
  final DateTime currentTime;
  const DateDisplay({super.key, required this.currentTime});

  Future<void> _openCalendar() async {
    const package = 'com.google.android.calendar';
    if (await InstalledApps.isAppInstalled(package) ?? false) {
      await InstalledApps.startApp(package);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openCalendar,
      child: Text(
        DateFormat('EEE, d MMM').format(currentTime),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
