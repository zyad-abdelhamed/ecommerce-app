import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.name,
    required super.price,
    required super.id,
    required super.description,
    required super.oldprice,
    required super.image,
    required super.discount,
  });
  factory ProductModel.fromjson({required Map<String, dynamic> data}) {
    return ProductModel(
        name: data['name'].toString(),
        price: data['price'].toInt(),
        id: data['id'].toInt(),
        description: data['description'].toString(),
        oldprice: data['old_price'].toInt(),
        image: data['image'].toString(),
        discount: data['discount'].toInt());
  }
  factory ProductModel.cartandfavouritesnamedconstructor(
      {required Map<String, dynamic> data}) {
    return ProductModel(
        name: data['product']['name'].toString(),
        price: data['product']['price'].toInt(),
        id: data['product']['id'].toInt(),
        description: data['product']['description'].toString(),
        oldprice: data['product']['old_price'].toInt(),
        image: data['product']['image'].toString(),
        discount: data['product']['discount'].toInt());
  }
}
