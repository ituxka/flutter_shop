import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_udemy_shop/core/error/exceptions/remote_db_exceptions.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/data_sources/data_source.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/models/product_model.dart';

const productPath = 'products';

class FirebaseDataSource implements ProductRemoteDataSource {
  FirebaseDataSource(this.firestore);

  final Firestore firestore;

  @override
  Future<ProductModel> getProduct(int id) async {
    final snapshot = await firestore.collection(productPath).getDocuments();

    if (snapshot.documents.isEmpty || snapshot.documents.length > 1) {
      throw NoEntityException();
    }

    final targetSnapshot = snapshot.documents[0];

    return ProductModel.fromJson(targetSnapshot.data);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final snapshot = await firestore.collection(productPath).getDocuments();

    if (snapshot.documents.isEmpty) {
      throw NoEntityException();
    }

    return snapshot.documents.map((DocumentSnapshot ds) {
      return ProductModel.fromJson(ds.data);
    }).toList();
  }
}
