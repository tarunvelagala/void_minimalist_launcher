import 'package:flutter/widgets.dart';
import 'package:return_zero/core/theme/app_layout.dart';
import 'package:return_zero/features/home/widgets/header/home_clock_column.dart';
import 'package:return_zero/features/home/widgets/header/home_usage_column.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppLayout.headerFlex(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [HomeClockColumn(), HomeUsageColumn()],
      ),
    );
  }
}
