import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TechColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TechColors.border),
      ),
      child: Row(
        children: [
          _buildImage(),
          Expanded(child: _buildInfo()),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
      child: SizedBox(
        width: 90, height: 90,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(product.imageUrl, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: TechColors.surfaceHigh,
                child: const Icon(Icons.devices, color: TechColors.textMuted),
              ),
            ),
            if (product.badge.isNotEmpty)
              Positioned(
                top: 4, left: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: product.badge == 'SALE' ? TechColors.success
                        : product.badge == 'HOT' ? Colors.orange
                        : TechColors.accent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(product.badge,
                    style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800,
                      color: TechColors.background),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 2),
          Text(product.description, maxLines: 1, overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: TechColors.textSecondary, fontSize: 11),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text('\$${product.price.toStringAsFixed(0)}',
                style: const TextStyle(color: TechColors.accent, fontWeight: FontWeight.w700, fontSize: 14),
              ),
              if (product.isOnSale) ...[
                const SizedBox(width: 6),
                Text('\$${product.originalPrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: TechColors.textMuted, fontSize: 11,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: TechColors.textMuted,
                  ),
                ),
              ],
              const Spacer(),
              const Icon(Icons.star_rounded, color: TechColors.warning, size: 12),
              const SizedBox(width: 2),
              Text(product.rating.toStringAsFixed(1),
                style: const TextStyle(color: TechColors.textSecondary, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
