import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  /// Categories that exist in the catalog (non-zero product count).
  final List<TechCategory> categories;
  final int totalProductCount;
  /// `null` means "All" is selected.
  final String? selectedCategoryName;
  final ValueChanged<String?> onSelectCategory;

  const CategorySection({
    super.key,
    required this.categories,
    required this.totalProductCount,
    required this.selectedCategoryName,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    if (totalProductCount == 0) {
      return const SizedBox.shrink();
    }

    final allCategory = TechCategory(
      name: 'All',
      numberOfProducts: totalProductCount,
      imageUrl: '',
      iconName: 'all',
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 12, top: 8),
            child: Text(
              'Shop by Category',
              style: TextStyle(
                color: TechColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: 1 + categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return CategoryCard(
                    category: allCategory,
                    isSelected: selectedCategoryName == null,
                    onTap: () => onSelectCategory(null),
                  );
                }
                final cat = categories[index - 1];
                return CategoryCard(
                  category: cat,
                  isSelected: selectedCategoryName == cat.name,
                  onTap: () => onSelectCategory(cat.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
