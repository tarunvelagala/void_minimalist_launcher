import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';
import 'package:return_zero/features/home/presentation/widgets/clock_widget.dart';
import 'package:return_zero/features/home/presentation/widgets/usage_stats_display.dart';
import 'package:return_zero/features/settings/presentation/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateToSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onLongPress: () => _navigateToSettings(context),
        behavior: HitTestBehavior.translucent, // Ensure long press works on empty space
        child: Consumer<HomeSettingsProvider>(
          builder: (context, settings, child) {
            return SizedBox.expand(
              child: Column(
                crossAxisAlignment: settings.alignment,
                children: [
                  const Spacer(flex: 1),
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
                   child: Column(
                     crossAxisAlignment: settings.alignment,
                      children: const [
                        ClockWidget(),
                        SizedBox(height: 16),
                        UsageStatsDisplay(),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
