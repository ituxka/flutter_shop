import 'package:flutter_udemy_shop/core/error/exceptions/remote_db_exceptions.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/models/product_model.dart';

abstract class ProductRemoteDataSource {
  /// [saveProductModel] saves [ProductModel] to remote database
  ///
  /// Throws [UnableToSaveDBException] if could not save product
  Future<void> saveProduct(ProductModel productModel);

  /// [getProduct] retrieves [ProductModel] from remote database
  ///
  /// Throws [NoEntityException] if there is no entity in remote database
  Future<ProductModel> getProduct(int id);

  /// [getProducts] retrieves all [ProductModel] from remote database
  ///
  /// Throws [NoEntityException] if there are no products
  Future<List<ProductModel>> getProducts();
}
