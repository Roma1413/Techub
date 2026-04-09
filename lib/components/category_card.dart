import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';

class CategoryCard extends StatelessWidget {
  final TechCategory category;

  const CategoryCard({super.key, required this.category});

  IconData _iconFromName(String name) {
    switch (name) {
      case 'phone_iphone': return Icons.phone_iphone;
      case 'laptop': return Icons.laptop;
      case 'sports_esports': return Icons.sports_esports;
      case 'home': return Icons.home;
      case 'headphones': return Icons.headphones;
      case 'watch': return Icons.watch;
      default: return Icons.devices;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: TechColors.surfaceHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TechColors.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: TechColors.accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_iconFromName(category.iconName), color: TechColors.accent, size: 22),
          ),
          const SizedBox(height: 8),
          Text(category.name, textAlign: TextAlign.center,
            style: const TextStyle(color: TechColors.textPrimary, fontSize: 11, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text('${category.numberOfProducts}', textAlign: TextAlign.center,
            style: const TextStyle(color: TechColors.textMuted, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
