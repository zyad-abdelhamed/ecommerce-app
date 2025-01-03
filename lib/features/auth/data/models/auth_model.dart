import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  late final String token;

  AuthModel({required this.token});
  AuthModel.fromjson({required Map<String, dynamic> jsondata}) {
    token = jsondata['data']['token'];
  }

  @override
  List<Object?> get props => [token];
}
