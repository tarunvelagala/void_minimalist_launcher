import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDisplay extends StatelessWidget {
  final DateTime currentTime;
  const TimeDisplay({super.key, required this.currentTime});

  Future<void> _openClock() async {
    if (Platform.isAndroid) {
      const intent = AndroidIntent(action: 'android.intent.action.SHOW_ALARMS');
      try {
        await intent.launch();
      } catch (e) {
        const String errorMessage = 'Could not open clock app:';
        debugPrint(errorMessage + e.toString());
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
