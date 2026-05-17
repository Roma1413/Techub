import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

/// Firestore path: `users/{uid}/favorites/{productId}`
class FavoritesService {
  CollectionReference<Map<String, dynamic>> _favorites(String uid) =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('favorites');

  Future<List<Product>> fetchAll(String uid) async {
    final snapshot = await _favorites(uid).get();
    return snapshot.docs.map(_productFromDoc).toList();
  }

  Stream<List<Product>> watchAll(String uid) {
    return _favorites(uid).snapshots().map(
          (snapshot) => snapshot.docs.map(_productFromDoc).toList(),
        );
  }

  Future<void> add(String uid, Product product) {
    return _favorites(uid).doc(product.id).set({
      ...productToMap(product),
      'savedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> remove(String uid, String productId) {
    return _favorites(uid).doc(productId).delete();
  }

  Future<void> syncAll(String uid, List<Product> products) async {
    if (products.isEmpty) return;
    final batch = FirebaseFirestore.instance.batch();
    for (final product in products) {
      batch.set(_favorites(uid).doc(product.id), {
        ...productToMap(product),
        'savedAt': FieldValue.serverTimestamp(),
      });
    }
    await batch.commit();
  }

  static Map<String, dynamic> productToMap(Product p) => {
        'id': p.id,
        'name': p.name,
        'description': p.description,
        'price': p.price,
        'originalPrice': p.originalPrice,
        'imageUrl': p.imageUrl,
        'rating': p.rating,
        'reviewCount': p.reviewCount,
        'inStock': p.inStock,
        'badge': p.badge,
        'specs': p.specs.map((s) => {'key': s.key, 'value': s.value}).toList(),
      };

  Product _productFromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Product.fromJson({...doc.data(), 'id': doc.id});
  }
}
