import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String productId;
  final String userName;
  final String text;
  final double rating;
  final DateTime date;

  Review({
    required this.id,
    required this.productId,
    required this.userName,
    required this.text,
    required this.rating,
    required this.date,
  });

  factory Review.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Review(
      id: snapshot.id,
      productId: data['productId'] ?? '',
      userName: data['userName'] ?? 'Anonymous',
      text: data['text'] ?? '',
      rating: (data['rating'] as num).toDouble(),
      date: (data['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'userName': userName,
    'text': text,
    'rating': rating,
    'date': date,
  };
}