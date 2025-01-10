import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name, email, phone, token;
  final String? image;

  const User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.token,
      required this.image});

  @override
  List<Object?> get props => [name, email, phone, token, image];
}
