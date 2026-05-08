import 'package:cloud_firestore/cloud_firestore.dart';
import 'review.dart';

class ReviewDao {
  final CollectionReference _collection =
  FirebaseFirestore.instance.collection('reviews');

  // ── Get reviews for a specific product as a stream ──
  Stream<List<Review>> getReviewsStream(String productId) {
    return _collection
        .where('productId', isEqualTo: productId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map(Review.fromSnapshot).toList());
  }

  // ── Add a new review ────────────────────────────────
  Future<void> addReview(Review review) {
    return _collection.add(review.toJson());
  }

  // ── Get average rating for a product ────────────────
  Future<double> getAverageRating(String productId) async {
    final snapshot = await _collection
        .where('productId', isEqualTo: productId)
        .get();

    if (snapshot.docs.isEmpty) return 0.0;

    final total = snapshot.docs.fold<double>(
      0.0,
          (sum, doc) =>
      sum + ((doc.data() as Map<String, dynamic>)['rating'] as num).toDouble(),
    );
    return total / snapshot.docs.length;
  }
}