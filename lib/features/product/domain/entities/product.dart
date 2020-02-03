import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Product extends Equatable {
  const Product({
    this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
  });

  final int id;
  final String title;
  final double price;
  final String imageUrl;

  @override
  List<Object> get props => [id, title, price, imageUrl];
}
