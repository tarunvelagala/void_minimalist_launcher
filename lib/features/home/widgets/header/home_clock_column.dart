import 'package:flutter/widgets.dart';
import 'package:return_zero/features/home/widgets/header/home_date_display.dart';
import 'package:return_zero/features/home/widgets/header/home_time_display.dart';

class HomeClockColumn extends StatelessWidget {
  const HomeClockColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [const HomeTimeDisplay(), const HomeDateDisplay()],
    );
  }
}
