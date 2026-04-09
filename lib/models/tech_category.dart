class TechCategory {
  final String name;
  final int numberOfProducts;
  final String imageUrl;
  final String iconName;

  TechCategory({
    required this.name,
    required this.numberOfProducts,
    required this.imageUrl,
    required this.iconName,
  });
}

final List<TechCategory> techCategories = [
  TechCategory(name: 'Smartphones',  numberOfProducts: 42, imageUrl: 'assets/categories/smartphones.png',  iconName: 'phone_iphone'),
  TechCategory(name: 'Laptops',      numberOfProducts: 28, imageUrl: 'assets/categories/laptops.png',      iconName: 'laptop'),
  TechCategory(name: 'Gaming',       numberOfProducts: 35, imageUrl: 'assets/categories/gaming.png',       iconName: 'sports_esports'),
  TechCategory(name: 'Smart Home',   numberOfProducts: 19, imageUrl: 'assets/categories/smart_home.png',   iconName: 'home'),
  TechCategory(name: 'Audio',        numberOfProducts: 31, imageUrl: 'assets/categories/audio.png',        iconName: 'headphones'),
  TechCategory(name: 'Wearables',    numberOfProducts: 24, imageUrl: 'assets/categories/wearables.png',    iconName: 'watch'),
];
