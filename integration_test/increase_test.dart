import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poc_flutter_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('screenshot', (WidgetTester tester) async {
    // Build the app.
    app.main();

    // Trigger a frame.
    await tester.pumpAndSettle();

    Finder incBtn = find.byKey(const Key('increase_btn'));
    await tester.tap(incBtn);
    await tester.tap(incBtn);
    await tester.tap(incBtn);

    // pump() triggers a new frame (rebuilds the widget), pumpWidget() sets
    // the root widget and then triggers a new frame, pumpAndSettle() calls pump()
    // until the widget does not request new frames anymore (usually when
    // animations are running).
    await tester.pump();

    // sleep(const Duration(seconds: 10));
    expect(find.text('3'), findsOneWidget);
  });
}
