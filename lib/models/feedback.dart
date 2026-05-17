import 'package:cloud_firestore/cloud_firestore.dart';

class AppFeedback {
  final String id;
  final String userId;
  final String userName;
  final String email;
  final String category;
  final String message;
  final double rating;
  final DateTime createdAt;

  AppFeedback({
    required this.id,
    required this.userId,
    required this.userName,
    required this.email,
    required this.category,
    required this.message,
    required this.rating,
    required this.createdAt,
  });

  factory AppFeedback.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AppFeedback(
      id: snapshot.id,
      userId: data['userId'] ?? '',
      userName: data['userName'] ?? 'User',
      email: data['email'] ?? '',
      category: data['category'] ?? 'General',
      message: data['message'] ?? '',
      rating: (data['rating'] as num?)?.toDouble() ?? 0,
      createdAt: _readDate(data['createdAt']),
    );
  }

  static DateTime _readDate(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is DateTime) return value;
    return DateTime.now();
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'email': email,
        'category': category,
        'message': message,
        'rating': rating,
        'createdAt': Timestamp.fromDate(createdAt),
      };
}
