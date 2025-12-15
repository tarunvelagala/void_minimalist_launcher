import 'package:flutter/material.dart';
import 'package:return_zero/core/utils/usage_utils.dart';
import 'package:return_zero/features/home/presentation/widgets/stats_row.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkAndFetchStats();
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        StatsRow(label: 'Usage', value: _screenTime),
        const SizedBox(height: 2),
        StatsRow(label: 'Unlocks', value: _unlockCount.toString()),
        if (!_isPermissionGranted) ...[
          const SizedBox(height: 2),
          StatsRow(label: 'Stats', onTap: UsageUtils.grantPermission),
        ],
      ],
    );
  }
}
