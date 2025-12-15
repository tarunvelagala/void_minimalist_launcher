import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/core/providers/theme_settings_provider.dart';
import 'package:return_zero/core/theme/app_theme.dart';
import 'package:return_zero/features/home/presentation/pages/home_page.dart';
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeSettingsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeSettingsProvider()),
      ],
      child: const ReturnZeroApp(),
    ),
  );
}

class ReturnZeroApp extends StatelessWidget {
  const ReturnZeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeSettingsProvider>(
      builder: (context, themeSettings, child) {
        return MaterialApp(
          title: 'Return Zero',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(themeSettings.textScaleFactor),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}
