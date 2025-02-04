import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';

class BannerModel extends Banners {
  const BannerModel({required super.id, required super.image});
  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      BannerModel(id: json['id'], image: json['image']);

  
}
