import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/constants/secret_keys.dart';
// import 'package:ecommerce_application/core/constants/secret_keys.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<Map<String, dynamic>> post(
      {required ApiServiceInputModel apiServiceInputModel}) async {
    Response response = await dio.post(apiServiceInputModel.url,
        queryParameters: apiServiceInputModel.body,
        options: Options(
            contentType: switch (apiServiceInputModel.apiContentType) {
              ApiContentTypeEnum.applicationJson => 'application/json',
              ApiContentTypeEnum.applicationXWwwFormUrlencoded =>
                'application/x_www_form_urlencoded',
            },
            headers: switch (apiServiceInputModel.apiHeaders) {
              ApiHeadersEnum.backEndHeadersWithoutToken => {},
              ApiHeadersEnum.backEndHeadersWithToken => {'Authorization': ApiConstant.token},
              ApiHeadersEnum.paymentHeaders => {
                 'Authorization': "Bearer ${SecretKeys.stripeSecretKey}"
                },
            }));
    return response.data;
  }

  Future<Map<String, dynamic>> get(
      {required ApiServiceInputModel apiServiceInputModel}) async {
    Response response = await dio.get(apiServiceInputModel.url,
        options: Options(
            contentType: switch (apiServiceInputModel.apiContentType) {
              ApiContentTypeEnum.applicationJson => 'application/json',
              ApiContentTypeEnum.applicationXWwwFormUrlencoded =>
                'application/x_www_form_urlencoded',
            },
            headers: switch (apiServiceInputModel.apiHeaders) {
              ApiHeadersEnum.backEndHeadersWithoutToken => {},
              ApiHeadersEnum.backEndHeadersWithToken => {'Authorization': ApiConstant.token},
              ApiHeadersEnum.paymentHeaders => {
                 // 'Authorization': "Bearer ${SecretKeys.stripeSecretKey}"
                },
            }));
    return response.data;
  }
}

//input model for all api service methodes
class ApiServiceInputModel {
  final String url;
  final Map<String, dynamic>? body;
  final ApiHeadersEnum apiHeaders;
  final ApiContentTypeEnum apiContentType;
  ApiServiceInputModel(
      {this.apiContentType = ApiContentTypeEnum.applicationJson,
      required this.url,
      this.body,
      required this.apiHeaders});
}

enum ApiHeadersEnum { backEndHeadersWithoutToken, backEndHeadersWithToken, paymentHeaders }

enum ApiContentTypeEnum { applicationJson, applicationXWwwFormUrlencoded }
