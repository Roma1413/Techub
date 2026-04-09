import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';

class StoreLandscapeCard extends StatefulWidget {
  final TechStore store;
  final VoidCallback onTap;

  const StoreLandscapeCard({super.key, required this.store, required this.onTap});

  @override
  State<StoreLandscapeCard> createState() => _StoreLandscapeCardState();
}

class _StoreLandscapeCardState extends State<StoreLandscapeCard> {
  bool _isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: TechColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: TechColors.border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildImage(),
            _buildInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(widget.store.imageUrl, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: TechColors.surfaceHigh,
                child: const Icon(Icons.store, color: TechColors.textMuted, size: 48),
              ),
            ),
            // Gradient overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0x80000000)],
                ),
              ),
            ),
            // Wishlist button
            Positioned(
              top: 8, right: 8,
              child: GestureDetector(
                onTap: () => setState(() => _isWishlisted = !_isWishlisted),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    _isWishlisted ? Icons.bookmark : Icons.bookmark_border,
                    color: _isWishlisted ? TechColors.accent : Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
            // Category badge
            Positioned(
              top: 8, left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: TechColors.accent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: TechColors.accent.withOpacity(0.4)),
                ),
                child: Text(widget.store.category,
                  style: const TextStyle(color: TechColors.accent, fontSize: 10, fontWeight: FontWeight.w600),
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
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.store.name,
            style: const TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(widget.store.attributes,
            maxLines: 1, overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: TechColors.textSecondary, fontSize: 11),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.star_rounded, color: TechColors.warning, size: 14),
              const SizedBox(width: 2),
              Text(widget.store.rating.toStringAsFixed(1),
                style: const TextStyle(color: TechColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.local_shipping_outlined, color: TechColors.textMuted, size: 12),
              const SizedBox(width: 2),
              Text(widget.store.deliveryTime,
                style: const TextStyle(color: TechColors.textSecondary, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
