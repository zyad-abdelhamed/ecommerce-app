import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
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
    sl.registerLazySingleton<BaseLocalization>(
      () => LocalizationImpl(sl<BaseCache>()),
    );
    sl.registerSingleton<BaseCache>(
      CacheImplBySharedPreferences(),
    );
  }
}
