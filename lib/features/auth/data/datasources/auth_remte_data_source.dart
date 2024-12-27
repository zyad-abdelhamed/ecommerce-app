import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class BaseAuthRemteDataSource {
  Future<void> signUp(SignUpParameters signUpParameters);
}

class AuthRemteDataSource extends BaseAuthRemteDataSource{
  @override
  Future<Unit> signUp(SignUpParameters signUpParameters) async{
    Response response = await http
        .post(Uri.parse("https://student.valuxapps.com/api/register"), body: {
      'name': signUpParameters.userName,
      'email': signUpParameters.email,
      'phone': signUpParameters.phoneNumber,
      'password': signUpParameters.password,
    });
    var responseBody = jsonDecode(response.body);
     if (responseBody['status'] == false) {
     throw ServerException(message: responseBody['message'] );
    }else{
      return unit;
    }
  }
}