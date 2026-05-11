import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techhub/components/product_item.dart';
import 'package:techhub/constants.dart';
import 'package:techhub/models/models.dart';

Widget _buildWrapped(Widget child) {
  return MaterialApp(
    theme: techHubTheme(),
    home: Scaffold(
      backgroundColor: TechColors.background,
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [child],
      ),
    ),
  );
}

/// Sample electronics product for TechHub-style widget tests.
final _mockMacBook = Product(
  id: 'test-widget-mbp',
  name: 'MacBook Pro 16"',
  description: 'M4 Pro · Liquid Retina XDR',
  price: 2499,
  originalPrice: 2799,
  imageUrl: 'assets/prod/mac.jpg',
  rating: 4.9,
  reviewCount: 1204,
  specs: [],
  badge: 'SALE',
);

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    try {
      await loadAppFonts();
    } catch (_) {}
  });

  group('ProductItem', () {
    late BookmarkManager bookmarks;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      bookmarks = BookmarkManager();
      await bookmarks.bindToUser('widget-test-user');
    });

    testWidgets('can build and shows product name and price', (tester) async {
      await tester.pumpWidget(
        _buildWrapped(
          ProductItem(
            product: _mockMacBook,
            bookmarkManager: bookmarks,
          ),
        ),
      );

      expect(find.byType(ProductItem), findsOneWidget);
      expect(find.text('MacBook Pro 16"'), findsOneWidget);
      expect(find.textContaining('2499'), findsWidgets);
    });

    testWidgets('can be bookmarked when icon is tapped', (tester) async {
      await tester.pumpWidget(
        _buildWrapped(
          ProductItem(
            product: _mockMacBook,
            bookmarkManager: bookmarks,
          ),
        ),
      );

      expect(find.byIcon(Icons.bookmark_border), findsOneWidget);

      await tester.tap(find.byIcon(Icons.bookmark_border));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.bookmark), findsOneWidget);
    });

    testWidgets('can be unbookmarked when tapped if initially bookmarked',
        (tester) async {
      await bookmarks.toggle(_mockMacBook);
      await tester.pumpWidget(
        _buildWrapped(
          ProductItem(
            product: _mockMacBook,
            bookmarkManager: bookmarks,
          ),
        ),
      );

      expect(find.byIcon(Icons.bookmark), findsOneWidget);

      await tester.tap(find.byIcon(Icons.bookmark));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.bookmark_border), findsOneWidget);
    });
  });

  group('Golden Tests - ProductItem', () {
    testGoldens('bookmark off vs on — TechHub theme', (tester) async {
      SharedPreferences.setMockInitialValues({});

      final off = BookmarkManager();
      await off.bindToUser('golden-off');

      final on = BookmarkManager();
      await on.bindToUser('golden-on');
      await on.toggle(_mockMacBook);

      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 2.15,
        bgColor: TechColors.background,
      )
        ..addScenario(
          'Bookmark off',
          ProductItem(product: _mockMacBook, bookmarkManager: off),
        )
        ..addScenario(
          'Bookmark on',
          ProductItem(product: _mockMacBook, bookmarkManager: on),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        wrapper: (child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: techHubTheme(),
          home: Material(
            color: TechColors.background,
            child: child,
          ),
        ),
      );

      await screenMatchesGolden(tester, 'techhub_product_item_bookmarks');
    });
  });
}
