import 'package:dartz/dartz.dart';
import 'package:flutter_udemy_shop/core/error/failures.dart';
import 'package:flutter_udemy_shop/core/usecases/usecase.dart';
import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';
import 'package:flutter_udemy_shop/features/product/domain/repositories/product_repository.dart';

class GetAllProducts extends UseCase<List<Product>, NoParams> {
  GetAllProducts(this._repository);

  final ProductRepository _repository;

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return _repository.getProducts();
  }
}
