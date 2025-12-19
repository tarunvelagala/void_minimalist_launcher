import 'package:flutter_test/flutter_test.dart';
import 'package:return_zero/app/app.dart';
import 'package:return_zero/features/home/homepage.dart';

void main() {
  testWidgets('App launch smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that the App displays a Homepage.
    expect(find.byType(Homepage), findsOneWidget);
  });
}
