import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatelessWidget {
  final DateTime currentTime;
  const DateDisplay({super.key, required this.currentTime});

  Future<void> _openCalendar() async {
    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data:
            'content://com.android.calendar/time/${DateTime.now().millisecondsSinceEpoch}',
      );

      try {
        await intent.launch();
      } catch (e) {
        debugPrint("Could not open calendar: $e");
      }
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
