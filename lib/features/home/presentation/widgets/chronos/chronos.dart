import 'dart:async';
import 'package:flutter/material.dart';
import 'package:return_zero/features/home/presentation/widgets/chronos/date_display.dart';
import 'package:return_zero/features/home/presentation/widgets/chronos/time_display.dart';

class Chronos extends StatefulWidget {
  const Chronos({super.key});

  @override
  State<Chronos> createState() => _ChronosState();
}

class _ChronosState extends State<Chronos> {
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();

    // Parent manages the shared timer
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) setState(() => _currentTime = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeDisplay(currentTime: _currentTime),
        const SizedBox(height: 4),
        DateDisplay(currentTime: _currentTime),
      ],
    );
  }
}
