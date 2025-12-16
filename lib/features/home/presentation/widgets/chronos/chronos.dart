import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:return_zero/features/home/presentation/widgets/chronos/battery_display.dart';
import 'package:return_zero/features/home/presentation/widgets/chronos/date_display.dart';
import 'package:return_zero/features/home/presentation/widgets/chronos/time_display.dart';

class ClockBatteryWidget extends StatefulWidget {
  const ClockBatteryWidget({super.key});

  @override
  State<ClockBatteryWidget> createState() => _ClockBatteryWidgetState();
}

class _ClockBatteryWidgetState extends State<ClockBatteryWidget> {
  late DateTime _currentTime;
  late Timer _timer;
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  StreamSubscription<BatteryState>? _batterySubscription;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();

    // Parent manages the shared timer
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) setState(() => _currentTime = DateTime.now());
    });

    // Parent manages the shared battery state
    _getBatteryLevel();
    _batterySubscription = _battery.onBatteryStateChanged.listen(
      (_) => _getBatteryLevel(),
    );
  }

  Future<void> _getBatteryLevel() async {
    final level = await _battery.batteryLevel;
    if (mounted) setState(() => _batteryLevel = level);
  }

  @override
  void dispose() {
    _timer.cancel();
    _batterySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeDisplay(currentTime: _currentTime),
        const SizedBox(height: 4),
        Row(
          children: [
            DateDisplay(currentTime: _currentTime),
            Text(
              ', ',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
            BatteryDisplay(level: _batteryLevel),
          ],
        ),
      ],
    );
  }
}
