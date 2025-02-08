import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/constants/secret_keys.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/models/api_service_input_model.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';

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
              ApiHeadersEnum.backEndHeadersWithToken => {
                  'Authorization': ApiConstant.token
                },
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
              ApiHeadersEnum.backEndHeadersWithoutToken => {
                  'lang': sl<BaseLocalization>().language
                },
              ApiHeadersEnum.backEndHeadersWithToken => {
                  'lang': sl<BaseLocalization>().language,
                  'Authorization': ApiConstant.token
                },
              ApiHeadersEnum.paymentHeaders => {
                  'Authorization': "Bearer ${SecretKeys.stripeSecretKey}"
                },
            }));
    return response.data;
  }
}
