import 'package:ecommerce_application/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({required super.token});
  factory AuthModel.fromjson({required Map<String, dynamic> jsondata}) {
    return AuthModel(token: jsondata['data']['token']);
  }
}
