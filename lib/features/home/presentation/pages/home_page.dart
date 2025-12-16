import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';
import 'package:return_zero/features/home/presentation/widgets/chronos/chronos.dart';
import 'package:return_zero/features/home/presentation/widgets/usage_stats/usage_stats.dart';
import 'package:return_zero/features/settings/presentation/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateToSettings(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onLongPress: () => _navigateToSettings(context),
        behavior: HitTestBehavior
            .translucent, // Ensure long press works on empty space
        child: Consumer<HomeSettingsProvider>(
          builder: (context, settings, child) {
            return SizedBox.expand(
              child: Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          ClockBatteryWidget(),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: UsageStatsDisplay(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
