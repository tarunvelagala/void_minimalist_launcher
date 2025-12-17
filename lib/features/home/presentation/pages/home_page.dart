import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/features/home/presentation/constants.dart';
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';
import 'package:return_zero/features/home/presentation/utils/alignment_utils.dart';
import 'package:return_zero/features/home/presentation/widgets/chronos/chronos.dart';
import 'package:return_zero/features/home/presentation/widgets/nomos/nomos.dart';
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
        behavior: HitTestBehavior.translucent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isTablet =
                constraints.maxWidth > Constants.tabletBreakpoint;
            final double horizontalPadding = isTablet
                ? Constants.tabletHorizontalPadding
                : Constants.mobileHorizontalPadding;

            return Consumer<HomeSettingsProvider>(
              builder: (context, settings, child) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: settings.alignment,
                      children: [
                        const SizedBox(height: Constants.topMargin),

                        // --- TOP BAR: Fixed Left/Right ---
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chronos(), // Left Widget
                            Nomos(), // Right Widget
                          ],
                        ),

                        const Spacer(),

                        // --- BODY: Respects Alignment Setting ---
                        Row(
                          mainAxisAlignment: settings.alignment.toMainAxis,
                          children: [
                            // A separate widget for your app list/text
                          ],
                        ),

                        const SizedBox(height: Constants.bottomMargin),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
