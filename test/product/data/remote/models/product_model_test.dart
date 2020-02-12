import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/models/product_model.dart';
import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tProductModel = ProductModel(id: 1, title: 'Test Model 1', price: 22.99, imageUrl: 'test image Url');

  test('should be a subclass of Product entity', () async {
    // assert
    expect(tProductModel, isA<Product>());
  });

  group('fromJson', () {
    test('should create a valid product from JSON', () async {
      // arrange
      final jsonMap = json.decode(fixture('product.json')) as Map<String, Object>;

      // act
      final Product result = ProductModel.fromJson(jsonMap);

      // assert
      expect(result, tProductModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      // arrange
      final Map<String, Object> expectedMap = {
        "id": 1,
        "title": "Test Model 1",
        "price": 22.99,
        "imageUrl": "test image Url",
      };

      // act
      final result = tProductModel.toJson();

      // assert
      expect(result, expectedMap);
    });
  });
}
