import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:intl/intl.dart';

class TimeDisplay extends StatelessWidget {
  final DateTime currentTime;
  const TimeDisplay({super.key, required this.currentTime});

  Future<void> _openClock() async {
    final packages = [
      'com.google.android.deskclock',
      'com.android.deskclock',
      'com.sec.android.app.clockpackage',
    ];
    for (var p in packages) {
      if (await InstalledApps.isAppInstalled(p) ?? false) {
        await InstalledApps.startApp(p);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openClock,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            DateFormat('h:mm').format(currentTime),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(width: 4),
          Text(
            DateFormat('a').format(currentTime),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
