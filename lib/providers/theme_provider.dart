import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider() : super(ThemeMode.system);

  void setLight() => apply(ThemeMode.light);
  void setDark() => apply(ThemeMode.dark);

  void apply(ThemeMode mode) => state = mode;
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>(
  (ref) => ThemeProvider(),
);
