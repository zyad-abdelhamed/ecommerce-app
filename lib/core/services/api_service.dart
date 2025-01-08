import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<Map<String, dynamic>> post(
      {required Map<String, dynamic> body,
      required String url,
      Map<String, dynamic>? headers}) async {
    Response response = await dio.post(url,
        queryParameters: body, options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> get(
      {Map<String, dynamic>? headers,Map<String, dynamic>? body, required String url}) async {
    Response response = await dio.get(url, options: Options(headers: headers));
    return response.data;
  }
}
