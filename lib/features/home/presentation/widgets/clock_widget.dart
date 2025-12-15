import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:installed_apps/installed_apps.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _launchClockApp() async {
    // List of common clock app package names
    const clockPackages = [
      'com.google.android.deskclock', // Google Clock
      'com.android.deskclock', // AOSP Clock
      'com.sec.android.app.clockpackage', // Samsung Clock
      'com.oneplus.deskclock', // OnePlus Clock
      'com.apple.mobiletimer', // iOS Clock (url scheme, not handled by installed_apps direct launch usually but safe to list)
    ];

    bool launched = false;
    for (final package in clockPackages) {
      try {
        bool? isInstalled = await InstalledApps.isAppInstalled(package);
        if (isInstalled == true) {
          await InstalledApps.startApp(package);
          launched = true;
          break;
        }
      } catch (e) {
        // Ignore errors, try next package
      }
    }

    if (!launched && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not find a clock app to launch.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('h:mm a');
    final dateFormat = DateFormat('EEE, MMM d');

    return GestureDetector(
      onTap: _launchClockApp,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Text(
            timeFormat.format(_currentTime),
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 64, // Slightly larger for emphasis
                ),
          ),
          const SizedBox(height: 8),
          Text(
            dateFormat.format(_currentTime),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
