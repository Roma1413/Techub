import '../models/models.dart';
import '../utils/shop_category_resolver.dart';

class ExploreData {
  final List<TechStore> stores;
  final List<TechCategory> categories;
  final List<TechPost> communityPosts;

  ExploreData(this.stores, this.categories, this.communityPosts);
}

class MockTechHubService {
  Future<ExploreData> getExploreData() async {
    final stores = await _getStores();
    final categories = ShopCategoryResolver.categoriesWithCounts(stores);
    final posts = await _getCommunityFeed();
    return ExploreData(stores, categories, posts);
  }

  Future<List<TechStore>> _getStores() async {
    await Future.delayed(const Duration(milliseconds: 60));
    return techStores;
  }

  Future<List<TechPost>> _getCommunityFeed() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return techPosts;
  }
}
