import 'package:flutter/material.dart';
import '../api/mock_techhub_service.dart';
import '../components/components.dart';
import '../constants.dart';
import '../models/models.dart';
import '../network/life_hack_service.dart'; // NEW

class ExplorePage extends StatefulWidget {
  final CartManager cartManager;
  final OrderManager orderManager;
  final BookmarkManager bookmarkManager;
  final SearchHistoryManager searchHistory;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const ExplorePage({
    super.key,
    required this.cartManager,
    required this.orderManager,
    required this.bookmarkManager,
    required this.searchHistory,
    required this.themeMode,
    required this.onToggleTheme,
  });

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _service = MockTechHubService();
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  final _lifeHackService = LifeHackService(); // NEW
  String _searchQuery = '';
  bool _showHistory = false;
  ExploreData? _data;
  LifeHack? _lifeHack;       // NEW
  bool _hackLoading = true;  // NEW

  @override
  void initState() {
    super.initState();
    _service.getExploreData().then((data) {
      if (mounted) setState(() => _data = data);
    });

    //stream

    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text.toLowerCase());
    });

    _searchFocusNode.addListener(() {
      setState(() => _showHistory = _searchFocusNode.hasFocus);
    });

    // NEW: fetch life hack on load
    _lifeHackService.fetchHack().then((hack) {
      if (mounted) setState(() {
        _lifeHack = hack;
        _hackLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String value) {
    final q = value.trim();
    if (q.isNotEmpty) {
      widget.searchHistory.add(q);
    }
    _searchFocusNode.unfocus();
    setState(() => _showHistory = false);
  }

  void _applyHistory(String query) {
    _searchController.text = query;
    _searchController.selection = TextSelection.fromPosition(
      TextPosition(offset: query.length),
    );
    _searchFocusNode.unfocus();
    setState(() {
      _searchQuery = query.toLowerCase();
      _showHistory = false;
    });
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
    return cats.where((c) =>
        c.name.toLowerCase().contains(_searchQuery)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechColors.background,
      body: SafeArea(
        child: _data == null
            ? const Center(
            child: CircularProgressIndicator(color: TechColors.accent))
            : CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverToBoxAdapter(child: _buildSearchBar()),
            if (_showHistory &&
                widget.searchHistory.history.isNotEmpty)
              SliverToBoxAdapter(child: _buildHistoryDropdown()),
            if (!_showHistory) ...[
              // NEW: life hack card shown when not searching
              if (_searchQuery.isEmpty)
                SliverToBoxAdapter(child: _buildLifeHackCard()),
              if (_searchQuery.isNotEmpty &&
                  _filteredStores.isEmpty &&
                  _filteredCategories.isEmpty)
                SliverToBoxAdapter(child: _buildNoResults())
              else ...[
                if (_filteredStores.isNotEmpty)
                  SliverToBoxAdapter(
                    child: StoreSection(
                      stores: _filteredStores,
                      cartManager: widget.cartManager,
                      orderManager: widget.orderManager,
                      bookmarkManager: widget.bookmarkManager,
                    ),
                  ),
                if (_searchQuery.isEmpty)
                  SliverToBoxAdapter(
                    child: CommunitySection(
                        posts: _data?.communityPosts ?? []),
                  ),
                if (_filteredCategories.isNotEmpty)
                  SliverToBoxAdapter(
                    child: CategorySection(
                        categories: _filteredCategories),
                  ),
              ],
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  // ─── HEADER ──────────────────────────────────────────
  Widget _buildHeader() {
    final isDark = widget.themeMode == ThemeMode.dark;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Good morning 👋',
                  style: TextStyle(
                      color: TechColors.textSecondary, fontSize: 13)),
              const SizedBox(height: 2),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Tech',
                    style: TextStyle(
                        color: TechColors.textPrimary,
                        fontSize: 26,
                        fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: 'Hub',
                    style: TextStyle(
                        color: TechColors.accent,
                        fontSize: 26,
                        fontWeight: FontWeight.w800),
                  ),
                ]),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: widget.onToggleTheme,
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: TechColors.surfaceHigh,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: TechColors.border),
              ),
              child: Icon(
                isDark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                color: TechColors.accent,
                size: 20,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: TechColors.surfaceHigh,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: TechColors.border),
            ),
            child: const Icon(Icons.notifications_outlined,
                color: TechColors.textSecondary, size: 20),
          ),
        ],
      ),
    );
  }

  // ─── SEARCH BAR ──────────────────────────────────────
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        onSubmitted: _onSearchSubmitted,
        style:
        const TextStyle(color: TechColors.textPrimary, fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Search products, stores...',
          hintStyle:
          const TextStyle(color: TechColors.textMuted, fontSize: 14),
          prefixIcon: const Icon(Icons.search,
              color: TechColors.textMuted, size: 20),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
            icon: const Icon(Icons.close,
                color: TechColors.textMuted, size: 18),
            onPressed: () {
              _searchController.clear();
              setState(() => _searchQuery = '');
            },
          )
              : null,
          filled: true,
          fillColor: TechColors.surfaceHigh,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: TechColors.border)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: TechColors.border)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: TechColors.accent, width: 1.5)),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  // ─── LIFE HACK CARD ──────────────────────────────────
  Widget _buildLifeHackCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: TechColors.surfaceHigh,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: TechColors.accent.withOpacity(0.3)),
        ),
        child: _hackLoading
            ? const Center(
          child: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: TechColors.accent,
              strokeWidth: 2,
            ),
          ),
        )
            : _lifeHack == null
            ? const SizedBox.shrink()
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.lightbulb_outline,
                    color: TechColors.warning, size: 16),
                const SizedBox(width: 6),
                const Text(
                  'Tip of the day',
                  style: TextStyle(
                    color: TechColors.textMuted,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                // Refresh button — makes a new API call
                GestureDetector(
                  onTap: () {
                    setState(() => _hackLoading = true);
                    _lifeHackService.fetchHack().then((hack) {
                      if (mounted) setState(() {
                        _lifeHack = hack;
                        _hackLoading = false;
                      });
                    });
                  },
                  child: const Icon(Icons.refresh,
                      color: TechColors.textMuted, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _lifeHack!.title,
              style: const TextStyle(
                color: TechColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _lifeHack!.description,
              style: const TextStyle(
                color: TechColors.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── HISTORY DROPDOWN ────────────────────────────────
  Widget _buildHistoryDropdown() {
    final suggestions =
    widget.searchHistory.suggestions(_searchController.text);
    if (suggestions.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: TechColors.surfaceHigh,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: TechColors.border),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 8, 4),
              child: Row(
                children: [
                  const Text('Recent searches',
                      style: TextStyle(
                          color: TechColors.textMuted,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      widget.searchHistory.clear();
                      setState(() {});
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Clear all',
                        style: TextStyle(
                            color: TechColors.accent, fontSize: 11)),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: TechColors.border),
            ...suggestions.map((query) => ListTile(
              dense: true,
              leading: const Icon(Icons.history,
                  color: TechColors.textMuted, size: 16),
              title: Text(query,
                  style: const TextStyle(
                      color: TechColors.textPrimary, fontSize: 13)),
              trailing: IconButton(
                icon: const Icon(Icons.close,
                    color: TechColors.textMuted, size: 14),
                onPressed: () {
                  widget.searchHistory.remove(query);
                  setState(() {});
                },
              ),
              onTap: () => _applyHistory(query),
            )),
          ],
        ),
      ),
    );
  }

  // ─── NO RESULTS ──────────────────────────────────────
  Widget _buildNoResults() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          const Icon(Icons.search_off, color: TechColors.textMuted, size: 52),
          const SizedBox(height: 16),
          const Text('No results found',
              style: TextStyle(
                  color: TechColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Text('Try a different search for "$_searchQuery"',
              style: const TextStyle(
                  color: TechColors.textSecondary, fontSize: 13)),
        ],
      ),
    );
  }
}