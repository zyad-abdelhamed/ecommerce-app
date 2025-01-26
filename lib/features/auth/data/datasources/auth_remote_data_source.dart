import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/auth/data/models/auth_model.dart';
import 'package:ecommerce_application/features/auth/data/models/sign_in_input_model.dart';
import 'package:ecommerce_application/features/auth/data/models/sign_up_model.dart';

abstract class BaseAuthRemteDataSource {
  Future<void> signUp(SignUpModel signUpModel);
  Future<AuthModel> login(LogInInputModel logInInputModel);
}

class AuthRemteDataSource extends BaseAuthRemteDataSource {
  final ApiService apiService;

  AuthRemteDataSource(this.apiService);
  @override
  Future<Unit> signUp(SignUpModel signUpModel) async {
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            body: signUpModel.toJson(),
            url: ApiConstant.registerEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithoutToken));

    return unit;
  }

  @override
  Future<AuthModel> login(LogInInputModel logInInputModel) async {
    Map<String, dynamic> responseBody = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            body: {
          "email": logInInputModel.email,
          'password': logInInputModel.password
        },
            url: ApiConstant.loginEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithoutToken));

    return AuthModel.fromjson(jsondata: responseBody);
  }
}
