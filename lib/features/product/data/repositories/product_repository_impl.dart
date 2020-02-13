import 'package:dartz/dartz.dart';
import 'package:flutter_udemy_shop/core/error/exceptions/remote_db_exceptions.dart';
import 'package:flutter_udemy_shop/core/error/failures/failures.dart';
import 'package:flutter_udemy_shop/core/error/failures/remote_db_failures.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/data_sources/data_source.dart';
import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';
import 'package:flutter_udemy_shop/features/product/domain/repositories/product_repository.dart';
import 'package:meta/meta.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({
    @required this.remoteDataSource,
  });

  final ProductRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Product>> getProduct(int id) async {
    try {
      final productModel = await remoteDataSource.getProduct(id);
      return Right(productModel);
    } on NoEntityException {
      return Left(NoEntityFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() {
    // TODO: implement getProducts
    return null;
  }
}
