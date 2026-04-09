import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';
import 'tech_post_card.dart';

class CommunitySection extends StatelessWidget {
  final List<TechPost> posts;

  const CommunitySection({super.key, required this.posts});

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
                Text('Community', style: TextStyle(
                  color: TechColors.textPrimary, fontSize: 22, fontWeight: FontWeight.w700,
                )),
                SizedBox(width: 8),
                Icon(Icons.bolt, color: TechColors.accent, size: 20),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: posts.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) => SizedBox(
                width: 260,
                child: TechPostCard(post: posts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
