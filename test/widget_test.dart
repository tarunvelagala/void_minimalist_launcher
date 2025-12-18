import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:return_zero/app/app.dart';

void main() {
  testWidgets('Return Zero app boots successfully', (
    WidgetTester tester,
  ) async {
    // Act
    await tester.pumpWidget(const App());

    // Assert
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
