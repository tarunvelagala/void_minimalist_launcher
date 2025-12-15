import 'package:flutter/material.dart';
import 'package:return_zero/core/theme/app_theme.dart';

void main() {
  runApp(const ReturnZeroApp());
}

class ReturnZeroApp extends StatelessWidget {
  const ReturnZeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Return Zero',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text('Return Zero'),
        ),
      ),
    );
  }
}
