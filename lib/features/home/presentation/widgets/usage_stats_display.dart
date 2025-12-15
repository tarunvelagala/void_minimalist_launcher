import 'package:flutter/material.dart';
import 'package:usage_stats/usage_stats.dart';

class UsageStatsDisplay extends StatefulWidget {
  const UsageStatsDisplay({super.key});

  @override
  State<UsageStatsDisplay> createState() => _UsageStatsDisplayState();
}

class _UsageStatsDisplayState extends State<UsageStatsDisplay> with WidgetsBindingObserver {
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
    bool? granted = await UsageStats.checkUsagePermission();
    if (mounted) {
      setState(() {
        _isPermissionGranted = granted == true;
      });
    }

    if (granted == true) {
      _fetchStats();
    }
  }

  Future<void> _fetchStats() async {
    try {
      DateTime now = DateTime.now();
      DateTime startOfDay = DateTime(now.year, now.month, now.day);
      DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      // Query usage stats for screen time
      List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startOfDay, endOfDay);
      
      int totalTimeInMs = 0;
      for (var stat in usageStats) {
        totalTimeInMs += int.parse(stat.totalTimeInForeground ?? '0');
      }

      int totalMinutes = (totalTimeInMs / 1000 / 60).round();
      int hours = totalMinutes ~/ 60;
      int minutes = totalMinutes % 60;

      String timeString = '${minutes}m';
      if (hours > 0) {
        timeString = '${hours}h ${minutes}m';
      }

      // Calculate unlock count
      // Event.KEYGUARD_HIDDEN = 18.
      List<EventUsageInfo> events = await UsageStats.queryEvents(startOfDay, endOfDay);
      int unlocks = 0;
      
      for (var event in events) {
        if (event.eventType == '18') {
          unlocks++;
        }
      }

      if (mounted) {
        setState(() {
          _screenTime = timeString;
          _unlockCount = unlocks; 
        });
      }
    } catch (e) {
      debugPrint('Error fetching usage stats: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
    );

    if (!_isPermissionGranted) {
      return TextButton.icon(
        onPressed: () => UsageStats.grantUsagePermission(),
        icon: Icon(Icons.security, size: 14, color: textStyle?.color),
        label: Text('Enable Stats', style: textStyle),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.access_time, size: 14, color: textStyle?.color),
        const SizedBox(width: 4),
        Text('Screen: $_screenTime', style: textStyle),
        const SizedBox(width: 16),
        Icon(Icons.lock_open, size: 14, color: textStyle?.color),
        const SizedBox(width: 4),
        Text('Unlocks: $_unlockCount', style: textStyle),
      ],
    );
  }
}
