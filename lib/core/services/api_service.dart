import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<Map<String, dynamic>> post(
      {required Map<String, dynamic> body, required String url}) async {
    Response response = await dio.post(url, queryParameters: body);
    return response.data;
  }
}
