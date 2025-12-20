import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:return_zero/core/theme/app_typography.dart';

class HomeTimeDisplay extends StatefulWidget {
  const HomeTimeDisplay({super.key});

  @override
  State<HomeTimeDisplay> createState() => _HomeTimeDisplayState();
}

class _HomeTimeDisplayState extends State<HomeTimeDisplay> {
  Timer? _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    final now = DateTime.now();
    final secondsUntilNextMinute = 60 - now.second;

    // First update exactly at next minute
    Timer(Duration(seconds: secondsUntilNextMinute), () {
      if (!mounted) return;

      setState(() {
        _currentTime = DateTime.now();
      });

      // Then update every minute, aligned
      _timer = Timer.periodic(const Duration(minutes: 1), (_) {
        if (mounted) {
          setState(() {
            _currentTime = DateTime.now();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('h:mm').format(_currentTime);
    final meridianStr = DateFormat('a').format(_currentTime);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(timeStr, style: AppTypography.timeDisplay(context)),
        const SizedBox(width: 4),
        Text(meridianStr, style: AppTypography.meridianDisplay(context)),
      ],
    );
  }
}
