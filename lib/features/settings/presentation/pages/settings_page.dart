import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/core/config/providers/theme_settings_provider.dart';
import 'package:return_zero/features/home/presentation/constants.dart'; // Reuse your home constants
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';
import 'package:return_zero/features/settings/presentation/widgets/common/choice_toggle.dart';
import 'package:return_zero/features/settings/presentation/widgets/settings_row.dart';
import 'package:return_zero/features/settings/presentation/widgets/settings_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine responsive padding based on breakpoints
          final bool isTablet =
              constraints.maxWidth > Constants.tabletBreakpoint;
          final double horizontalPadding = isTablet
              ? Constants.tabletHorizontalPadding
              : Constants.mobileHorizontalPadding;

          final double verticalPadding = isTablet
              ? Constants.tabletVerticalPadding
              : Constants.mobileVerticalPadding;

          return SafeArea(
            child: ListView(
              // Applying the calculated horizontal padding
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              children: [
                // Appearance Group
                SettingSection(
                  header: 'Appearance',
                  children: [
                    Consumer<ThemeSettingsProvider>(
                      builder: (context, settings, _) => SettingRow(
                        title: 'Text Size',
                        action: ChoiceToggle<double>(
                          selectedValue: settings.textScaleFactor,
                          onSelected: settings.setTextScaleFactor,
                          options: [
                            ChoiceOption('S', 0.8),
                            ChoiceOption('M', 1.0),
                            ChoiceOption('L', 1.2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Layout Group
                SettingSection(
                  header: 'Layout',
                  children: [
                    Consumer<HomeSettingsProvider>(
                      builder: (context, settings, _) => SettingRow(
                        title: 'Alignment',
                        action: ChoiceToggle<CrossAxisAlignment>(
                          selectedValue: settings.alignment,
                          onSelected: settings.setAlignment,
                          options: [
                            ChoiceOption('Left', CrossAxisAlignment.start),
                            ChoiceOption('Center', CrossAxisAlignment.center),
                            ChoiceOption('Right', CrossAxisAlignment.end),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: Constants.bottomMargin),
              ],
            ),
          );
        },
      ),
    );
  }
}
