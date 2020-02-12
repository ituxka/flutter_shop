import 'package:flutter_udemy_shop/features/product/domain/entities/product.dart';
import 'package:meta/meta.dart';

class ProductModel extends Product {
  const ProductModel({
    @required int id,
    @required String title,
    @required double price,
    @required String imageUrl,
  }) : super(id: id, title: title, price: price, imageUrl: imageUrl);

  factory ProductModel.fromJson(Map<String, Object> json) {
    return ProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'].toString(),
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'].toString(),
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object> get props => [id, title, price, imageUrl];
}
