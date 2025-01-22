import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final int id;
  final String name;
  final String city;
  final String region;
  final String details;
  const AddressEntity(
      {required this.id,
      required this.name,
      required this.city,
      required this.region,
      required this.details});

  @override
  List<Object?> get props => [id, name, city, region, details];
}
