import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class HomeDateDisplay extends StatefulWidget {
  const HomeDateDisplay({super.key});

  @override
  State<HomeDateDisplay> createState() => _HomeDateDisplayState();
}

class _HomeDateDisplayState extends State<HomeDateDisplay> {
  late Timer _timer;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    // Update every minute to catch the date change at midnight
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != _currentDate.day) {
        if (mounted) {
          setState(() {
            _currentDate = now;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('E, d MMM').format(_currentDate);
    return Text(
      dateStr,
      style: AppTypography.dateDisplay(
        context,
        scaleFactor: AppTypography.defaultScaleFactor,
      ),
    );
  }
}
