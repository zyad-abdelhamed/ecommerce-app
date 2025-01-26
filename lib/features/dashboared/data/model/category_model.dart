import 'package:ecommerce_application/features/dashboared/domain/entity/category.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {required super.id, required super.name, required super.image});
  factory CategoryModel.fromjson(Map<String, dynamic> json) =>
      CategoryModel(id: json['id'], name: json['name'], image: json['image']);
}
