import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/auth/data/models/auth_model.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/log_in.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/sign_up.dart';

abstract class BaseAuthRemteDataSource {
  Future<void> signUp(SignUpParameters signUpParameters);
  Future<AuthModel> login(LogInParameters logInParameters);
}

class AuthRemteDataSource extends BaseAuthRemteDataSource {
  final ApiService apiService;

  AuthRemteDataSource(this.apiService);
  @override
  Future<Unit> signUp(SignUpParameters signUpParameters) async {
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            body: {
          'name': signUpParameters.userName,
          'email': signUpParameters.email,
          'phone': signUpParameters.phoneNumber,
          'password': signUpParameters.password,
        },
            url: ApiConstant.registerEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithoutToken));

    return unit;
  }

  @override
  Future<AuthModel> login(LogInParameters logInParameters) async {
    Map<String, dynamic> responseBody = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            body: {
          "email": logInParameters.email,
          'password': logInParameters.password
        },
            url: ApiConstant.loginEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithoutToken));

    return AuthModel.fromjson(jsondata: responseBody);
  }
}
