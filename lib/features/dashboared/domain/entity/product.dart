import 'package:equatable/equatable.dart';
// import 'package:hive/hive.dart';
// part 'product.g.dart';
// @HiveType(typeId: 0)
class Product extends Equatable {
  // @HiveField(0)
  final int id;
  // @HiveField(1)
  final String name;
  // @HiveField(2)
  final int price;
  // @HiveField(3)
  final String description;
  // @HiveField(4)
  final int oldprice;
  // @HiveField(5)
  final String image;
  // @HiveField(6)
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
