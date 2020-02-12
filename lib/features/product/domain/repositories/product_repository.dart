import 'package:dartz/dartz.dart';
import 'package:flutter_udemy_shop/core/error/failures/failures.dart';
import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';

/// ProductRepository represent the product's repository contract
abstract class ProductRepository {
  Future<Either<Failure, Product>> getProduct(int id);

  Future<Either<Failure, List<Product>>> getProducts();
}
