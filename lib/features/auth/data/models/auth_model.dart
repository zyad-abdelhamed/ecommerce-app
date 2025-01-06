import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
   final String token;

  const AuthModel({required this.token});
  factory AuthModel.fromjson({required Map<String, dynamic> jsondata}) {
   return AuthModel(token: jsondata['data']['token']);
  }

  @override
  List<Object?> get props => [token];
}
