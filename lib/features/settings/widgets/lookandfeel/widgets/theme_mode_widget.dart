import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_zero/core/theme/app_typography.dart';
import 'package:return_zero/providers/theme_provider.dart';

class ThemeModeWidget extends ConsumerWidget {
  const ThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Theme Mode',
          style: AppTypography.titleMedium(
            context,
            scaleFactor: AppTypography.defaultScaleFactor,
          ),
        ),
        Text(
          currentThemeMode.toString(),
          style: AppTypography.bodyMedium(
            context,
            scaleFactor: AppTypography.defaultScaleFactor,
          ),
        ),
      ],
    );
  }
}
