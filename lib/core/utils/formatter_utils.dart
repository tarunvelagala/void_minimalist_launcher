import 'package:intl/intl.dart';

class FormatterUtils {
  static String formatUnlocks(String? value) {
    if (value == null) return '0';

    // Parse the string to a number
    final num? number = num.tryParse(value);
    if (number == null) return value;

    // Use NumberFormat.compact() for 1K, 1M, 1B etc.
    // .format() handles the scaling and suffix automatically
    return NumberFormat.compact().format(number);
  }

  static String formatDuration(int totalSeconds) {
    if (totalSeconds <= 0) return '0M';

    final duration = Duration(seconds: totalSeconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}H ${minutes}M';
    } else {
      return '${minutes}M';
    }
  }
}
