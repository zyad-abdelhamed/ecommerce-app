import 'package:equatable/equatable.dart';

class LogInInputModel extends Equatable {
  final String email;
  final String password;

  const LogInInputModel({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}