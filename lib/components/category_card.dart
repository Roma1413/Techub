import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';

class CategoryCard extends StatelessWidget {
  final TechCategory category;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    this.isSelected = false,
    this.onTap,
  });

  IconData _iconFromName(String name) {
    switch (name) {
      case 'phone_iphone': return Icons.phone_iphone;
      case 'laptop': return Icons.laptop;
      case 'sports_esports': return Icons.sports_esports;
      case 'home': return Icons.home;
      case 'headphones': return Icons.headphones;
      case 'watch': return Icons.watch;
      case 'all': return Icons.apps_rounded;
      default: return Icons.devices;
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected ? TechColors.accent : TechColors.border;
    final iconBg = isSelected
        ? TechColors.accent.withOpacity(0.22)
        : TechColors.accent.withOpacity(0.12);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 90,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: TechColors.surfaceHigh,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: isSelected ? 1.5 : 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_iconFromName(category.iconName),
                    color: TechColors.accent, size: 22),
              ),
              const SizedBox(height: 8),
              Text(category.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: TechColors.textPrimary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text('${category.numberOfProducts}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: TechColors.textMuted, fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
