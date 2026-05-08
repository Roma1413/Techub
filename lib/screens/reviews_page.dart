import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/review.dart';
import '../models/review_dao.dart';
import '../models/user.dart';

class ReviewsPage extends StatefulWidget {
  final String productId;
  final String productName;
  final User user;

  const ReviewsPage({
    super.key,
    required this.productId,
    required this.productName,
    required this.user,
  });

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final _reviewDao = ReviewDao();
  final _textController = TextEditingController();
  double _selectedRating = 5.0;
  bool _submitting = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() => _submitting = true);

    final review = Review(
      id: '',
      productId: widget.productId,
      userName: widget.user.firstName,
      text: text,
      rating: _selectedRating,
      date: DateTime.now(),
    );

    await _reviewDao.addReview(review);

    _textController.clear();
    setState(() {
      _submitting = false;
      _selectedRating = 5.0;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review submitted!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechColors.background,
      appBar: AppBar(
        backgroundColor: TechColors.background,
        iconTheme: const IconThemeData(color: TechColors.textPrimary),
        title: Text(
          '${widget.productName} Reviews',
          style: const TextStyle(
            color: TechColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          // ── Write a review ──────────────────────────
          _buildReviewForm(),
          const Divider(color: TechColors.border),
          // ── Live reviews list via Stream ────────────
          Expanded(child: _buildReviewsList()),
        ],
      ),
    );
  }

  Widget _buildReviewForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: TechColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Write a Review',
            style: TextStyle(
              color: TechColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          // Star rating selector
          Row(
            children: List.generate(5, (i) {
              final star = i + 1;
              return GestureDetector(
                onTap: () => setState(() => _selectedRating = star.toDouble()),
                child: Icon(
                  star <= _selectedRating
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  color: TechColors.warning,
                  size: 32,
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _textController,
            maxLines: 3,
            style: const TextStyle(color: TechColors.textPrimary, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Share your thoughts...',
              hintStyle: const TextStyle(color: TechColors.textMuted),
              filled: true,
              fillColor: TechColors.surfaceHigh,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: TechColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: TechColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: TechColors.accent, width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitting ? null : _submitReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: TechColors.accent,
                foregroundColor: TechColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _submitting
                  ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: TechColors.background,
                ),
              )
                  : const Text('Submit Review',
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  // ── StreamBuilder — updates live from Firestore ─────
  Widget _buildReviewsList() {
    return StreamBuilder<List<Review>>(
      stream: _reviewDao.getReviewsStream(widget.productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: TechColors.accent),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.reviews_outlined,
                    color: TechColors.textMuted, size: 52),
                SizedBox(height: 12),
                Text('No reviews yet',
                    style: TextStyle(
                        color: TechColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 6),
                Text('Be the first to review this product',
                    style: TextStyle(
                        color: TechColors.textSecondary, fontSize: 13)),
              ],
            ),
          );
        }

        final reviews = snapshot.data!;
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: reviews.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) => _buildReviewCard(reviews[index]),
        );
      },
    );
  }

  Widget _buildReviewCard(Review review) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: TechColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TechColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: TechColors.accent.withOpacity(0.15),
                ),
                child: Center(
                  child: Text(
                    review.userName[0].toUpperCase(),
                    style: const TextStyle(
                      color: TechColors.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.userName,
                        style: const TextStyle(
                            color: TechColors.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13)),
                    Text(
                      '${review.date.day}/${review.date.month}/${review.date.year}',
                      style: const TextStyle(
                          color: TechColors.textMuted, fontSize: 11),
                    ),
                  ],
                ),
              ),
              // Star rating display
              Row(
                children: List.generate(5, (i) {
                  return Icon(
                    i < review.rating
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: TechColors.warning,
                    size: 14,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review.text,
            style: const TextStyle(
              color: TechColors.textSecondary,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}