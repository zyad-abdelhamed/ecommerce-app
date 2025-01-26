import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  final String email;
  final String userName;
  final String password;
  final String phoneNumber;

  const SignUpModel(
      {required this.email,
      required this.userName,
      required this.password,
      required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'name': userName,
      'email': email,
      'phone': phoneNumber,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [email, userName, password, phoneNumber];
}
