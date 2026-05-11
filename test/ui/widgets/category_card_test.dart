import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:techhub/components/category_card.dart';
import 'package:techhub/models/tech_category.dart';

/// Wraps tech UI the same way as MaterialApp + scrollable body (Chapter 18 pattern).
Widget _buildWrapped(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: ListView(
        children: [child],
      ),
    ),
  );
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    try {
      await loadAppFonts();
    } catch (_) {
      // Optional: CI/some setups may not ship all fonts
    }
  });

  group('CategoryCard', () {
    testWidgets('can build for a tech category', (tester) async {
      await tester.pumpWidget(
        _buildWrapped(
          CategoryCard(category: techCategories.first),
        ),
      );

      expect(find.byType(CategoryCard), findsOneWidget);
      expect(find.text('Smartphones'), findsOneWidget);
      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('shows laptop icon and label for Laptops', (tester) async {
      await tester.pumpWidget(
        _buildWrapped(
          CategoryCard(category: techCategories[1]),
        ),
      );

      expect(find.byIcon(Icons.laptop), findsOneWidget);
      expect(find.text('Laptops'), findsOneWidget);
    });
  });

  group('Golden Tests - CategoryCard', () {
    testGoldens('light theme — tech category grid', (tester) async {
      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 0.82,
      )
        ..addScenario(
          'Phones',
          CategoryCard(category: techCategories[0]),
        )
        ..addScenario(
          'Laptops',
          CategoryCard(category: techCategories[1]),
        )
        ..addScenario(
          'Gaming',
          CategoryCard(category: techCategories[2]),
        )
        ..addScenario(
          'Audio',
          CategoryCard(category: techCategories[4]),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
        ),
      );

      await screenMatchesGolden(tester, 'light_tech_category_card_grid');
    });

    testGoldens('dark theme — tech category grid', (tester) async {
      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 0.82,
      )
        ..addScenario(
          'Wearables',
          CategoryCard(category: techCategories[5]),
        )
        ..addScenario(
          'Smart Home',
          CategoryCard(category: techCategories[3]),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        wrapper: materialAppWrapper(
          theme: ThemeData.dark(),
        ),
      );

      await screenMatchesGolden(tester, 'dark_tech_category_card_grid');
    });
  });
}
