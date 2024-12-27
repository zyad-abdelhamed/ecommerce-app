import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class BaseAuthRemteDataSource {
  Future<void> signUp(SignUpParameters signUpParameters);
}

class AuthRemteDataSource extends BaseAuthRemteDataSource{
 final ApiService apiService;

  AuthRemteDataSource(this.apiService);
  @override
  Future<Unit> signUp(SignUpParameters signUpParameters) async{
    // Response response = await http
    //     .post(Uri.parse("https://student.valuxapps.com/api/register"), body: {
    //   'name': signUpParameters.userName,
    //   'email': signUpParameters.email,
    //   'phone': signUpParameters.phoneNumber,
    //   'password': signUpParameters.password,
    // });
   Map<String, dynamic> responseBody = await apiService.post(body:{
      'name': signUpParameters.userName,
      'email': signUpParameters.email,
      'phone': signUpParameters.phoneNumber,
      'password': signUpParameters.password,
    } , url: "https://student.valuxapps.com/api/register");
    // var responseBody = jsonDecode(response.body);
     if (responseBody['status'] == false) {
     throw ServerException(message: responseBody['message'] );
    }else{
      return unit;
    }
  }
}