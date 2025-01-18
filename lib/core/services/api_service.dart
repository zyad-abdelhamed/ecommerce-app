import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<Map<String, dynamic>> post(
      {required ApiServiceInputModel apiServiceInputModel}) async {
    Response response = await dio.post(apiServiceInputModel.url,
        queryParameters: apiServiceInputModel.body,
        options: Options(headers: apiServiceInputModel.headers));
    return response.data;
  }

  Future<Map<String, dynamic>> get(
      {required ApiServiceInputModel apiServiceInputModel}) async {
    Response response = await dio.get(apiServiceInputModel.url,
        options: Options(headers: apiServiceInputModel.headers));
    return response.data;
  }
}

//input model for all api service methodes
class ApiServiceInputModel {
  final String url;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? headers;

  ApiServiceInputModel({required this.url, this.body, this.headers});
}
