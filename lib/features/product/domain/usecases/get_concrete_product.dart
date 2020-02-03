import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_udemy_shop/core/error/failures.dart';
import 'package:flutter_udemy_shop/core/usecases/usecase.dart';
import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';
import 'package:flutter_udemy_shop/features/product/domain/repositories/product_repository.dart';
import 'package:meta/meta.dart';

class GetConcreteProduct implements UseCase<Product, Params> {
  GetConcreteProduct(this._repository);

  final ProductRepository _repository;

  @override
  Future<Either<Failure, Product>> call(Params params) async {
    return _repository.getProduct(params.id);
  }
}

class Params extends Equatable {
  const Params({
    @required this.id,
  });

  final int id;

  @override
  List<Object> get props => [id];
}
