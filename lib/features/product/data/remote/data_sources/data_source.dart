import 'package:flutter_udemy_shop/core/error/exceptions/remote_db_exceptions.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/models/product_model.dart';

abstract class ProductRemoteDataSource {
  /// [getProduct] retrieves [ProductModel] from remote database
  ///
  /// Throws [NetworkException] if there is an error retrieving entity
  /// Throws [NoEntityException] if there is no such entity in database
  Future<ProductModel> getProduct(int id);

  /// [getProducts] retrieves all [ProductModel] from remote database
  ///
  /// Throws [NetworkException] if there is an error retrieving entities
  /// Throws [NoEntityException] if there are no entities in database
  Future<List<ProductModel>> getProducts();
}
