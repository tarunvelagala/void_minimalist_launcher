import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider() : super(ThemeMode.system);

  void setTheme(final ThemeMode mode) => state = mode;
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>(
  (ref) => ThemeProvider(),
);
