// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:return_zero/core/config/providers/theme_settings_provider.dart';
import 'package:return_zero/features/home/presentation/providers/home_settings_provider.dart';
import 'package:return_zero/main.dart';

void main() {
  testWidgets('ReturnZeroApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeSettingsProvider()),
          ChangeNotifierProvider(create: (_) => ThemeSettingsProvider()),
        ],
        child: const ReturnZeroApp(),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify that the home page is displayed
    // The ClockWidget should be present on the home page
    expect(find.byType(Scaffold), findsWidgets);
  });
}
