import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  final List<TechCategory> categories;

  const CategorySection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 12, top: 8),
            child: Text('Shop by Category', style: TextStyle(
              color: TechColors.textPrimary, fontSize: 22, fontWeight: FontWeight.w700,
            )),
          ),
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) => CategoryCard(category: categories[index]),
            ),
          ),
        ],
      ),
    );
  }
}
