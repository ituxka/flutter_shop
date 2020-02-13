import 'package:dartz/dartz.dart';
import 'package:flutter_udemy_shop/core/error/exceptions/remote_db_exceptions.dart';
import 'package:flutter_udemy_shop/core/error/failures/failures.dart';
import 'package:flutter_udemy_shop/core/error/failures/remote_db_failures.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/data_sources/data_source.dart';
import 'package:flutter_udemy_shop/features/product/data/repositories/product_repository_impl_errors.dart';
import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';
import 'package:flutter_udemy_shop/features/product/domain/repositories/product_repository.dart';
import 'package:meta/meta.dart';

typedef DataRetriever<T> = Future<T> Function();

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({
    @required this.remoteDataSource,
  });

  final ProductRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Product>> getProduct(int id) async {
    return _getData(() => remoteDataSource.getProduct(id));
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    return _getData(() => remoteDataSource.getProducts());
  }

  Future<Either<Failure, T>> _getData<T>(DataRetriever<T> fn) async {
    try {
      final data = await fn();
      return Right(data);
    } on NetworkException {
      return Left(const NetworkFailure(dbGeneralFailureMessage));
    } on NoEntityException {
      return Left(const NoEntityFailure(dbNoEntityFailureMessage));
    } catch (e) {
      rethrow;
    }
  }
}
