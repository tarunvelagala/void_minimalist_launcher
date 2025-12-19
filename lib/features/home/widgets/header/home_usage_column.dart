import 'package:flutter/widgets.dart';
import 'package:return_zero/features/home/widgets/header/home_glance_display.dart';
import 'package:return_zero/features/home/widgets/header/home_usage_display.dart';

class HomeUsageColumn extends StatelessWidget {
  const HomeUsageColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [HomeUsageDisplay(), HomeGlanceDisplay()],
    );
  }
}
