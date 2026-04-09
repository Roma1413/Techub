import 'package:flutter/material.dart';
import '../api/mock_techhub_service.dart';
import '../components/components.dart';
import '../constants.dart';
import '../models/models.dart';

class ExplorePage extends StatefulWidget {
  final CartManager cartManager;
  final OrderManager orderManager;

  const ExplorePage({super.key, required this.cartManager, required this.orderManager});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _service = MockTechHubService();
  final _searchController = TextEditingController();
  String _searchQuery = '';
  ExploreData? _data;

  @override
  void initState() {
    super.initState();
    _service.getExploreData().then((data) {
      if (mounted) setState(() => _data = data);
    });
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text.toLowerCase());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<TechStore> get _filteredStores {
    final stores = _data?.stores ?? [];
    if (_searchQuery.isEmpty) return stores;
    return stores.where((s) =>
      s.name.toLowerCase().contains(_searchQuery) ||
      s.category.toLowerCase().contains(_searchQuery) ||
      s.products.any((p) => p.name.toLowerCase().contains(_searchQuery))
    ).toList();
  }

  List<TechCategory> get _filteredCategories {
    final cats = _data?.categories ?? [];
    if (_searchQuery.isEmpty) return cats;
    return cats.where((c) => c.name.toLowerCase().contains(_searchQuery)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechColors.background,
      body: SafeArea(
        child: _data == null
            ? const Center(child: CircularProgressIndicator(color: TechColors.accent))
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: _buildHeader()),
                  SliverToBoxAdapter(child: _buildSearchBar()),
                  if (_searchQuery.isNotEmpty && _filteredStores.isEmpty && _filteredCategories.isEmpty)
                    SliverToBoxAdapter(child: _buildNoResults())
                  else ...[
                    if (_filteredStores.isNotEmpty)
                      SliverToBoxAdapter(child: StoreSection(
                        stores: _filteredStores,
                        cartManager: widget.cartManager,
                        orderManager: widget.orderManager,
                      )),
                    if (_searchQuery.isEmpty)
                      SliverToBoxAdapter(child: CommunitySection(posts: _data?.communityPosts ?? [])),
                    if (_filteredCategories.isNotEmpty)
                      SliverToBoxAdapter(child: CategorySection(categories: _filteredCategories)),
                  ],
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                ],
              ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Good morning 👋', style: TextStyle(color: TechColors.textSecondary, fontSize: 13)),
              const SizedBox(height: 2),
              RichText(text: const TextSpan(children: [
                TextSpan(text: 'Tech', style: TextStyle(color: TechColors.textPrimary, fontSize: 26, fontWeight: FontWeight.w800)),
                TextSpan(text: 'Hub', style: TextStyle(color: TechColors.accent, fontSize: 26, fontWeight: FontWeight.w800)),
              ])),
            ],
          ),
          const Spacer(),
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: TechColors.surfaceHigh,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: TechColors.border),
            ),
            child: const Icon(Icons.notifications_outlined, color: TechColors.textSecondary, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: TechColors.textPrimary, fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Search products, stores...',
          hintStyle: const TextStyle(color: TechColors.textMuted, fontSize: 14),
          prefixIcon: const Icon(Icons.search, color: TechColors.textMuted, size: 20),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close, color: TechColors.textMuted, size: 18),
                  onPressed: () => _searchController.clear(),
                )
              : null,
          filled: true,
          fillColor: TechColors.surfaceHigh,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: TechColors.border)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: TechColors.border)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: TechColors.accent, width: 1.5)),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildNoResults() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          const Icon(Icons.search_off, color: TechColors.textMuted, size: 52),
          const SizedBox(height: 16),
          const Text('No results found', style: TextStyle(color: TechColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Text('Try a different search for "$_searchQuery"',
            style: const TextStyle(color: TechColors.textSecondary, fontSize: 13)),
        ],
      ),
    );
  }
}
