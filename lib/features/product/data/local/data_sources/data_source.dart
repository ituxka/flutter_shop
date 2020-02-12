import 'package:flutter_udemy_shop/core/error/exceptions/local_db_exceptions.dart';
import 'package:flutter_udemy_shop/features/product/data/local/models/product_model.dart';

abstract class ProductLocalDataSource {
  /// [saveProductModel] saves [ProductModel] to local database
  ///
  /// Throws [CouldNotSaveToLocalDBException] if could not save product
  Future<void> saveProduct(ProductModel productModel);

  /// [getProduct] retrieves [ProductModel] from local database
  ///
  /// Throws [NoEntityException] if there is no entity in local database
  Future<ProductModel> getProduct(int id);

  /// [getProducts] retrieves all [ProductModel] from local database
  ///
  /// Throws [NoEntityException] if there are no products
  Future<List<ProductModel>> getProducts();
}
