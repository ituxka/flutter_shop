import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  const ProductModel({
    @required int id,
    @required String title,
    @required double price,
    @required String imageUrl,
  }) : super(id: id, title: title, price: price, imageUrl: imageUrl);

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  List<Object> get props => [id, title, price, imageUrl];
}
