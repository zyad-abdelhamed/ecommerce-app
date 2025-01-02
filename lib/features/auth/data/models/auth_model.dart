class AuthModel {
  late final String token;

  AuthModel({required this.token});
  AuthModel.fromjson({required Map<String, dynamic> jsondata}) {
    token = jsondata['data']['token'];
  }
}
