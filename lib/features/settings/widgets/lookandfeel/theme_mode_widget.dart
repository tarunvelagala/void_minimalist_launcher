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
    final notifier = ref.read(themeProvider.notifier);
    final modes = [ThemeMode.light, ThemeMode.dark];
    final labels = ["Light", "Dark"];

    return SettingsRow(
      label: 'Theme Mode',
      control: ToggleButtons(
        isSelected: modes.map((m) => m == currentThemeMode).toList(),
        onPressed: (index) => notifier.apply(modes[index]),
        renderBorder: false,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fillColor: Colors.transparent,
        selectedColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.onSurface,
        textStyle: AppTypography.bodySmall(
          context,
          scaleFactor: AppTypography.defaultScaleFactor,
        ),
        children: labels.map((label) => Text(label)).toList(),
      ),
    );
  }
}
