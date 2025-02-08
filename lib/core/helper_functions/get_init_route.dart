import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/features/auth/data/datasources/auth_local_data_source.dart';

String get getInitRoute {
  // if (sl<BaseCache>().getboolFromCache(key: CacheConstants.onBoardingKey) ==
  //     false) {
  //   sl.get<BaseAuthLocalDataSource>().haveToken(token: ApiConstant.token)
  //       ? 'dashboard'
  //       : 'login';
  // }

  // return 'OnBoarding';
  // if (sl<BaseCache>().getboolFromCache(key: CacheConstants.onBoardingKey) ==
  //         null ||
  //     sl<BaseCache>().getboolFromCache(key: CacheConstants.onBoardingKey) ==
  //         true) {
  //   return 'OnBoarding';
  // }
  return sl.get<BaseAuthLocalDataSource>().haveToken(token: ApiConstant.token)
      ? 'dashboard'
      : 'login';
}
