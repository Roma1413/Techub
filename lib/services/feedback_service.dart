import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/feedback.dart';

class FeedbackService {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('feedbacks');

  Future<void> submit(AppFeedback feedback) {
    return _collection.add(feedback.toJson());
  }

  Future<List<AppFeedback>> fetchUserFeedback(String userId) async {
    final snapshot =
        await _collection.where('userId', isEqualTo: userId).get();
    final items = snapshot.docs.map(AppFeedback.fromSnapshot).toList();
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items;
  }
}
