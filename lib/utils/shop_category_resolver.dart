import '../models/models.dart';

/// Maps catalog products to the same "Shop by Category" labels as the home UI.
class ShopCategoryResolver {
  ShopCategoryResolver._();

  /// Display order for chips (only non-empty counts are shown).
  static const List<String> canonicalOrder = [
    'Smartphones',
    'Laptops',
    'Gaming',
    'Smart Home',
    'Audio',
    'Wearables',
  ];

  static const Map<String, String> _iconForCategory = {
    'Smartphones': 'phone_iphone',
    'Laptops': 'laptop',
    'Gaming': 'sports_esports',
    'Smart Home': 'home',
    'Audio': 'headphones',
    'Wearables': 'watch',
  };

  /// Primary shop category for a product, or null if none matches.
  static String? classifyProduct(Product p) {
    final t = '${p.name} ${p.description}'.toLowerCase();

    if (_containsAny(t, [
          'playstation',
          ' ps5',
          'ps5',
          'xbox',
          'nintendo switch',
          'steam deck',
        ])) {
      return 'Gaming';
    }

    if (_containsAny(t, ['galaxy tab', 'ipad', 'tablet'])) {
      return 'Laptops';
    }

    if (_containsAny(t, [
          'iphone',
          'galaxy s',
          'pixel ',
          'smartphone',
          'oneplus',
        ])) {
      return 'Smartphones';
    }

    if (_containsAny(t, [
          'macbook',
          'laptop',
          'chromebook',
          'surface laptop',
        ])) {
      return 'Laptops';
    }

    if (_containsAny(t, [
          'airpods',
          'headphone',
          'headphones',
          'earbuds',
          'buds',
          'wh-1000',
          'xm6',
          'xm5',
          'soundbar',
        ])) {
      return 'Audio';
    }

    if (_containsAny(t, [
          'apple watch',
          'galaxy watch',
          'watch ultra',
          'fitbit',
          'wearable',
        ])) {
      return 'Wearables';
    }

    if (_containsAny(t, [
          'qled',
          'oled tv',
          'bravia',
          'google tv',
          'smart tv',
          ' 65"',
          ' 55"',
          'mirrorless',
          'alpha 7',
          'alpha ',
          'camera',
          'echo',
          'nest',
          'thermostat',
        ])) {
      return 'Smart Home';
    }

    return null;
  }

  static bool _containsAny(String haystack, List<String> needles) {
    for (final n in needles) {
      if (haystack.contains(n)) return true;
    }
    return false;
  }

  /// Categories that have at least one product in [stores], with real counts.
  static List<TechCategory> categoriesWithCounts(List<TechStore> stores) {
    final counts = <String, int>{};
    for (final s in stores) {
      for (final p in s.products) {
        final c = classifyProduct(p);
        if (c != null) {
          counts[c] = (counts[c] ?? 0) + 1;
        }
      }
    }

    final out = <TechCategory>[];
    for (final name in canonicalOrder) {
      final n = counts[name];
      if (n != null && n > 0) {
        out.add(TechCategory(
          name: name,
          numberOfProducts: n,
          imageUrl: '',
          iconName: _iconForCategory[name] ?? 'devices',
        ));
      }
    }
    return out;
  }

  /// Store with only products in [categoryName]; empty product list if none match.
  static TechStore storeKeepingCategory(TechStore store, String categoryName) {
    final products = store.products
        .where((p) => classifyProduct(p) == categoryName)
        .toList();
    return TechStore(
      id: store.id,
      name: store.name,
      address: store.address,
      imageUrl: store.imageUrl,
      rating: store.rating,
      category: store.category,
      deliveryTime: store.deliveryTime,
      deliveryFee: store.deliveryFee,
      attributes: store.attributes,
      products: products,
    );
  }
}
