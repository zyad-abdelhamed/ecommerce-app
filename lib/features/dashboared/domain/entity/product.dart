import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final int price;
  final String description;
  final int oldprice;
  final String image;
  final int discount;

  const Product(
      {required this.name,
      required this.price,
      required this.id,
      required this.description,
      required this.oldprice,
      required this.image,
      required this.discount});

  
  @override
  List<Object?> get props =>
      [id, name, price, description, oldprice, image, discount];
}
