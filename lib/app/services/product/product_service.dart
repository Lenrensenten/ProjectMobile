import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final CollectionReference _productCollection =
  FirebaseFirestore.instance.collection('products');

  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
    required int stock,
    required String category,
    required String imageUrl,
  }) async {
    try {
      Map<String, dynamic> productData = {
        'name': name,
        'description': description,
        'price': price,
        'stock': stock,
        'category': category,
        'imageUrl': imageUrl,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await _productCollection.add(productData);
      print("Product added successfully!");
    } catch (e) {
      print("Failed to add product: $e");
    }
  }

  // Fungsi untuk mengambil data produk dari Firestore sebagai stream
  Stream<QuerySnapshot> getProducts() {
    return _productCollection.orderBy('createdAt', descending: true).snapshots();
  }
}
