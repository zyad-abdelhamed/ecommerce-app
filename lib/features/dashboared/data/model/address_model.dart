import 'package:ecommerce_application/features/dashboared/domain/entity/address.dart';

class AddressModel extends AddressEntity {
  const AddressModel(
      {required super.id,
      required super.name,
      required super.city,
      required super.region,
      required super.details});
  factory AddressModel.fromjson(Map<String, dynamic> data) => AddressModel(
      id: data['id'],
      name: data['name'],
      city: data['city'],
      region: data['region'],
      details: data['details']);
}
