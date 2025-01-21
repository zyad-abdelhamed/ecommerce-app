import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.name,
      required super.email,
      required super.phone,
      required super.token,
      required super.image});

  factory UserModel.formJson({required Map<String, dynamic> data}) {
    return UserModel(
        name: data['name'],
        email: data['email'],
        phone: data['phone'],
        token: data['token'],
        image: data['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'token': token,
      'image': image,
    };
  }
}
