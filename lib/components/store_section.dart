import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants.dart';
import '../models/models.dart';
import 'store_landscape_card.dart';

class StoreSection extends StatelessWidget {
  final List<TechStore> stores;
  final CartManager cartManager;
  final OrderManager orderManager;

  const StoreSection({
    super.key,
    required this.stores,
    required this.cartManager,
    required this.orderManager,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 12, top: 8),
            child: Row(
              children: [
                Text('Featured Stores', style: TextStyle(
                  color: TechColors.textPrimary, fontSize: 22, fontWeight: FontWeight.w700,
                )),
                Spacer(),
                Text('See all', style: TextStyle(color: TechColors.accent, fontSize: 13)),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, color: TechColors.accent, size: 16),
              ],
            ),
          ),
          SizedBox(
            height: 245,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: stores.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final store = stores[index];
                return SizedBox(
                  width: 260,
                  child: StoreLandscapeCard(
                    store: store,
                    onTap: () => context.go('/store/${store.id}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
