import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_udemy_shop/core/error/exceptions/remote_db_exceptions.dart';
import 'package:flutter_udemy_shop/core/error/failures/remote_db_failures.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/data_sources/data_source.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/models/product_model.dart';
import 'package:flutter_udemy_shop/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_udemy_shop/features/product/data/repositories/product_repository_impl_errors.dart';
import 'package:mockito/mockito.dart';

class MockProductRemoteDataSource extends Mock implements ProductRemoteDataSource {}

void main() {
  ProductRepositoryImpl productRepository;
  MockProductRemoteDataSource productRemoteDataSource;

  setUp(() {
    productRemoteDataSource = MockProductRemoteDataSource();
    productRepository = ProductRepositoryImpl(remoteDataSource: productRemoteDataSource);
  });

  const tProductModel = ProductModel(
    id: 1,
    title: 'TestProduct',
    price: 12,
    imageUrl: '',
  );

  final tId = tProductModel.id;

  const List<ProductModel> tProductsModels = [
    tProductModel,
    ProductModel(
      id: 2,
      title: 'TestProduct2',
      price: 22,
      imageUrl: '',
    )
  ];

  group('getProduct', () {
    test('should return appropriate Product with given id', () async {
      // arrange
      when(productRemoteDataSource.getProduct(any)).thenAnswer((_) async => tProductModel);

      // act
      final result = await productRepository.getProduct(tId);

      // assert
      expect(result, Right(tProductModel));
      verify(productRemoteDataSource.getProduct(tId));
      verifyNoMoreInteractions(productRemoteDataSource);
    });

    test('should return DBFailure with message when remoteDataSource throws DBException', () async {
      // arrange
      when(productRemoteDataSource.getProduct(any)).thenThrow(DBException());

      // act
      final result = await productRepository.getProduct(tId);

      // assert
      expect(result, equals(Left(const DBFailure(dbGeneralFailureMessage))));
      verify(productRemoteDataSource.getProduct(tId));
      verifyNoMoreInteractions(productRemoteDataSource);
    });

    test('should return NoEntityFailure message when remoteDataSource throws NoEntityException', () async {
      // arrange
      when(productRemoteDataSource.getProduct(any)).thenThrow(NoEntityException());

      // act
      final result = await productRepository.getProduct(tId);

      // assert
      expect(result, Left(const NoEntityFailure(dbNoEntityFailureMessage)));
      verify(productRemoteDataSource.getProduct(tId));
      verifyNoMoreInteractions(productRemoteDataSource);
    });
  });

  group('getProducts', () {
    test('should return array of Products if remote call was successfyl', () async {
      // arrange
      when(productRemoteDataSource.getProducts()).thenAnswer((_) async => tProductsModels);

      // act
      final result = await productRepository.getProducts();

      // assert
      expect(result, Right(tProductsModels));
      verify(productRemoteDataSource.getProducts());
      verifyNoMoreInteractions(productRemoteDataSource);
    });

    test('should return DBFailure if remote call was UNsuccessfyl', () async {
      // arrange
      when(productRemoteDataSource.getProducts()).thenThrow(DBException());

      // act
      final result = await productRepository.getProducts();

      // assert
      expect(result, equals(Left(const DBFailure(dbGeneralFailureMessage))));
    });

    test('should return NoEntityFailure message when remoteDataSource throws NoEntityException', () async {
      // arrange
      when(productRemoteDataSource.getProducts()).thenThrow(NoEntityException());

      // act
      final result = await productRepository.getProducts();

      // assert
      expect(result, Left(const NoEntityFailure(dbNoEntityFailureMessage)));
      verify(productRemoteDataSource.getProducts());
      verifyNoMoreInteractions(productRemoteDataSource);
    });
  });
}
