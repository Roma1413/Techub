import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/components.dart';
import '../components/product_details.dart';
import '../constants.dart';
import '../models/models.dart';
import 'checkout_page.dart';

class StorePage extends StatefulWidget {
  final TechStore store;
  final CartManager cartManager;
  final OrderManager ordersManager;

  const StorePage({
    super.key,
    required this.store,
    required this.cartManager,
    required this.ordersManager,
  });

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  static const double desktopThreshold = 700;
  static const double drawerWidth = 380;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _columnCount(double width) =>
      width > desktopThreshold ? 2 : 1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: TechColors.background,
      endDrawer: _buildEndDrawer(),
      floatingActionButton: _buildCartFab(),
      body: Center(
        child: SizedBox(
          width: screenWidth.clamp(0.0, 1000.0),
          child: CustomScrollView(
            slivers: [
              _buildSliverAppBar(),
              _buildInfoSection(),
              _buildProductsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // ───────────────────────── APP BAR ─────────────────────────

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 280,
      backgroundColor: TechColors.background,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => context.go('/explore'),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // ✅ SAFE ASSET LOADING
            Image.asset(
              widget.store.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: TechColors.surfaceHigh,
                  child: const Icon(
                    Icons.broken_image,
                    size: 60,
                    color: Colors.white,
                  ),
                );
              },
            ),

            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    TechColors.background,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ───────────────────────── INFO SECTION ─────────────────────────

  SliverToBoxAdapter _buildInfoSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.store.category,
              style: const TextStyle(
                color: TechColors.accent,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              widget.store.name,
              style: const TextStyle(
                color: TechColors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              widget.store.address,
              style: const TextStyle(
                color: TechColors.textSecondary,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              widget.store.getRatingAndDelivery(),
              style: const TextStyle(
                color: TechColors.textSecondary,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              widget.store.attributes,
              style: const TextStyle(
                color: TechColors.textMuted,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ───────────────────────── PRODUCTS ─────────────────────────

  SliverToBoxAdapter _buildProductsSection() {
    final columns = _columnCount(MediaQuery.of(context).size.width);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Products',
              style: TextStyle(
                color: TechColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.store.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3.2,
              ),
              itemBuilder: (context, index) {
                final product = widget.store.products[index];

                return GestureDetector(
                  onTap: () => _showProductDetails(product),
                  child: ProductItem(product: product),
                );
              },
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // ───────────────────────── PRODUCT DETAILS ─────────────────────────

  void _showProductDetails(Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      constraints: const BoxConstraints(maxWidth: 500),
      builder: (_) => ProductDetails(
        product: product,
        cartManager: widget.cartManager,
        quantityUpdated: () => setState(() {}),
      ),
    );
  }

  // ───────────────────────── DRAWER ─────────────────────────

  Widget _buildEndDrawer() {
    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        backgroundColor: TechColors.surface,
        child: CheckoutPage(
          cartManager: widget.cartManager,
          didUpdate: () => setState(() {}),
          onSubmit: (order) {
            widget.ordersManager.addOrder(order);

            context.pop();
            context.go('/orders');
          },
        ),
      ),
    );
  }

  // ───────────────────────── CART BUTTON ─────────────────────────

  Widget _buildCartFab() {
    final count = widget.cartManager.items.length;

    return FloatingActionButton.extended(
      onPressed: () =>
          _scaffoldKey.currentState?.openEndDrawer(),
      backgroundColor: TechColors.accent,
      foregroundColor: TechColors.background,
      icon: const Icon(Icons.shopping_cart_outlined),
      label: Text(
        count == 0 ? 'Cart' : '$count items',
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}