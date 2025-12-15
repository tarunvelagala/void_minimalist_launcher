import 'package:flutter/foundation.dart';
import 'package:usage_stats/usage_stats.dart';

class UsageData {
  final String screenTime;
  final int unlockCount;

  UsageData({required this.screenTime, required this.unlockCount});
}

class UsageUtils {
  static Future<bool> checkPermission() async {
    return (await UsageStats.checkUsagePermission()) == true;
  }

  static Future<void> grantPermission() async {
    await UsageStats.grantUsagePermission();
  }

  static Future<UsageData> getStats() async {
    try {
      DateTime now = DateTime.now();
      DateTime startOfDay = DateTime(now.year, now.month, now.day);
      DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      // Query usage stats for screen time
      List<UsageInfo> usageStats = await UsageStats.queryUsageStats(
        startOfDay,
        endOfDay,
      );

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
      List<EventUsageInfo> events = await UsageStats.queryEvents(
        startOfDay,
        endOfDay,
      );
      int unlocks = 0;

      for (var event in events) {
        if (event.eventType == '18') {
          unlocks++;
        }
      }

      return UsageData(screenTime: timeString, unlockCount: unlocks);
    } catch (e) {
      debugPrint('Error fetching usage stats: $e');
      return UsageData(screenTime: '0m', unlockCount: 0);
    }
  }
}
