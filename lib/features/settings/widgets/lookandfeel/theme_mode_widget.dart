import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_zero/core/theme/app_typography.dart';
import 'package:return_zero/features/settings/widgets/common/settings_row.dart';
import 'package:return_zero/providers/theme_provider.dart';

class ThemeModeWidget extends ConsumerWidget {
  const ThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeProvider);

    return SettingsRow(
      label: 'Theme Mode',
      control: Text(
        currentThemeMode == ThemeMode.system
            ? 'System'
            : currentThemeMode == ThemeMode.light
            ? 'Light'
            : 'Dark',
        style: AppTypography.bodySmall(
          context,
          scaleFactor: AppTypography.defaultScaleFactor,
        ),
      ),
    );
  }
}
