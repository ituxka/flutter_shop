import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_udemy_shop/core/error/exceptions/remote_db_exceptions.dart';
import 'package:flutter_udemy_shop/core/error/failures/remote_db_failures.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/data_sources/data_source.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/models/product_model.dart';
import 'package:flutter_udemy_shop/features/product/data/repositories/product_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockProductLocalDataSource extends Mock implements ProductRemoteDataSource {}

void main() {
  ProductRepositoryImpl productRepository;
  MockProductLocalDataSource productLocalDataSource;

  setUp(() {
    productLocalDataSource = MockProductLocalDataSource();
    productRepository = ProductRepositoryImpl(remoteDataSource: productLocalDataSource);
  });

  const tProductModel = ProductModel(
    id: 1,
    title: 'TestProduct',
    price: 12,
    imageUrl: '',
  );

  final tId = tProductModel.id;

  group('getProduct', () {
    test('should return appropriate Product with given id', () async {
      // arrange
      when(productLocalDataSource.getProduct(any)).thenAnswer((_) async => tProductModel);

      // act
      final result = await productRepository.getProduct(tId);

      // assert
      expect(result, Right(tProductModel));
      verify(productLocalDataSource.getProduct(tId));
      verifyNoMoreInteractions(productLocalDataSource);
    });

    test('should return NoEntityFailure when LocalDataSource throws NoEntityException', () async {
      // arrange
      when(productLocalDataSource.getProduct(any)).thenThrow(NoEntityException());

      // act
      final result = await productRepository.getProduct(tId);

      // assert
      expect(result, equals(Left(NoEntityFailure())));
      verify(productLocalDataSource.getProduct(tId));
      verifyNoMoreInteractions(productLocalDataSource);
    });
  });
}
