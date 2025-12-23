import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider() : super(ThemeMode.system);

  void setLight() => state = ThemeMode.light;
  void setDark() => state = ThemeMode.dark;
  void setSystem() => state = ThemeMode.system;
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>(
  (ref) => ThemeProvider(),
);
