import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';
import 'package:flutter_udemy_shop/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_udemy_shop/features/product/domain/usecases/get_concrete_product.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  GetConcreteProduct usecase;
  MockProductRepository productRepository;

  setUp(() {
    productRepository = MockProductRepository();
    usecase = GetConcreteProduct(productRepository);
  });

  const tId = 1;
  const tProduct = Product(id: tId, title: 'Test Product', price: 20, imageUrl: '');

  test('should get product for the id from repository', () async {
    // arrange
    when(productRepository.getProduct(any)).thenAnswer((_) async => Right(tProduct));

    // act
    final result = await usecase(const Params(id: tId));

    // assert
    expect(result, Right(tProduct));
    verify(productRepository.getProduct(tId));
    verifyNoMoreInteractions(productRepository);
  });
}
