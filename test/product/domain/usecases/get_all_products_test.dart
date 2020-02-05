import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_udemy_shop/core/usecases/usecase.dart';
import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';
import 'package:flutter_udemy_shop/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_udemy_shop/features/product/domain/usecases/get_all_products.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  MockProductRepository productRepository;
  GetAllProducts usecase;

  setUp(() {
    productRepository = MockProductRepository();
    usecase = GetAllProducts(productRepository);
  });

  final List<Product> tProducts = [
    const Product(id: 1, price: 21, title: 'Test t1', imageUrl: ''),
    const Product(id: 2, price: 22, title: 'Test t2', imageUrl: ''),
    const Product(id: 3, price: 23, title: 'Test t3', imageUrl: ''),
  ];

  test('should return all products from repository', () async {
    // arrange
    when(productRepository.getProducts()).thenAnswer((_) async => Right(tProducts));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, Right(tProducts));
    verify(productRepository.getProducts()).called(1);
  });
}
