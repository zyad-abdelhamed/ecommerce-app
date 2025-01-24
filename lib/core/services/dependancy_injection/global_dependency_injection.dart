import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class GlobalDependencyInjection {
  static void init() {
    sl.registerLazySingleton<Dio>(
      () => Dio(),
    );
    sl.registerLazySingleton<ApiService>(
      () => ApiService(sl()),
    );
  }
}
