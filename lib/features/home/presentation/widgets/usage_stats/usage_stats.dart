import 'package:flutter/material.dart';
import 'package:return_zero/features/home/domain/utils/usage_utils.dart';
import 'package:return_zero/features/home/presentation/widgets/usage_stats/stat.dart';
import 'package:return_zero/features/home/presentation/widgets/usage_stats/usage_permissions.dart';

class UsageStatsDisplay extends StatefulWidget {
  const UsageStatsDisplay({super.key});

  @override
  State<UsageStatsDisplay> createState() => _UsageStatsDisplayState();
}

class _UsageStatsDisplayState extends State<UsageStatsDisplay>
    with WidgetsBindingObserver {
  int _unlockCount = 0;
  String _screenTime = '0m';
  bool _isPermissionGranted = false;
  bool _isWellbeingAvailable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkAndFetchStats();
    _checkWellbeingAvailability();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkAndFetchStats();
    }
  }

  Future<void> _checkAndFetchStats() async {
    bool granted = await UsageUtils.checkPermission();
    if (mounted) {
      setState(() {
        _isPermissionGranted = granted;
      });
    }

    if (granted) {
      final stats = await UsageUtils.getStats();
      if (mounted) {
        setState(() {
          _screenTime = stats.screenTime;
          _unlockCount = stats.unlockCount;
        });
      }
    }
  }

  Future<void> _checkWellbeingAvailability() async {
    bool available = await UsageUtils.isWellbeingAvailable();
    if (mounted) {
      setState(() {
        _isWellbeingAvailable = available;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isWellbeingAvailable ? UsageUtils.openDigitalWellbeing : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_isPermissionGranted) ...[
            Stat(label: 'Usage', value: _screenTime),
            const SizedBox(height: 2),
            Stat(label: 'Unlocks', value: _unlockCount.toString()),
          ] else
            UsagePermissions(onTap: UsageUtils.grantPermission),
        ],
      ),
    );
  }
}
