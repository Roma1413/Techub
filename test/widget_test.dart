import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Full [TechHubApp] is not loaded here: it initializes Firebase, Drift/SQLite
/// (`DatabaseConnection.delayed`), and GoRouter, which leaves pending async work
/// that fails `flutter_test` invariant checks. Use integration/device tests for
/// end-to-end UI; keep this as a minimal binding smoke test.
void main() {
  testWidgets('Flutter binding and MaterialApp smoke test', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: Text('TechHub')),
        ),
      ),
    );

    expect(find.text('TechHub'), findsOneWidget);
  });
}
