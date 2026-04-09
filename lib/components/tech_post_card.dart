import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';

class TechPostCard extends StatelessWidget {
  final TechPost post;

  const TechPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: TechColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TechColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: TechColors.surfaceHigh,
                child: Text(post.username[0].toUpperCase(),
                  style: const TextStyle(color: TechColors.accent, fontWeight: FontWeight.w700, fontSize: 13),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('@${post.username}',
                      style: const TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    Text('${post.timestamp} ago',
                      style: const TextStyle(color: TechColors.textMuted, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.favorite_border, color: TechColors.textMuted, size: 12),
                  const SizedBox(width: 2),
                  Text('${post.likes}', style: const TextStyle(color: TechColors.textMuted, fontSize: 10)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(post.comment,
            maxLines: 2, overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: TechColors.textSecondary, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }
}
