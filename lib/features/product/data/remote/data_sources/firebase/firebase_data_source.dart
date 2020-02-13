import 'package:firebase/firestore.dart';
import 'package:flutter_udemy_shop/core/error/exceptions/remote_db_exceptions.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/data_sources/data_source.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/models/product_model.dart';

const productPath = 'products';

class FirebaseDataSource implements ProductRemoteDataSource {
  FirebaseDataSource(this.firestore);

  final Firestore firestore;

  @override
  Future<ProductModel> getProduct(int id) async {
    final snapshot = await firestore.collection(productPath).where('id', '==', id).get();

    if (snapshot.empty || snapshot.size > 1) {
      throw NoEntityException();
    }

    final targetSnapshot = snapshot.docs[0];

    return ProductModel.fromJson(targetSnapshot.data());
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final snapshot = await firestore.collection(productPath).get();

    if (snapshot.empty) {
      throw NoEntityException();
    }

    return snapshot.docs.map((DocumentSnapshot el) {
      return ProductModel.fromJson(el.data());
    }).toList();
  }
}
