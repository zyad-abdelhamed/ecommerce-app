import 'package:ecommerce_application/features/dashboared/domain/entity/category.dart';

class CategoriesModel extends Categories {
  const CategoriesModel(
      {required super.id, required super.name, required super.image});
  factory CategoriesModel.fromjson(Map<String, dynamic> json) =>
      CategoriesModel(id: json['id'], name: json['name'], image: json['image']);
}
