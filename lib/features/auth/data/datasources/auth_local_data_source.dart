import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';

abstract class BaseAuthLocalDataSource {
  Future<void> insertTokenToCache({required String token});
  Future<void> getTokenFromCache();
  bool haveToken({required String token});
}

class AuthLocalDataSource extends BaseAuthLocalDataSource {
  @override
  Future<void> getTokenFromCache() async {
    ApiConstant.token = sl<BaseCache>().getStringFromCache(key: CacheConstants.tokenKey) ?? '';
  }

  @override
  bool haveToken({required String token}) {
    if (token == "") {
      return false;
    }
    return true;
  }

  @override
  Future<void> insertTokenToCache({required String token}) async {
    await sl<BaseCache>().insertStringToCache(key: 'token', value: token);
  }
}
