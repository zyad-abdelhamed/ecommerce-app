import 'package:ecommerce_application/core/services/shared.dart';

abstract class BaseAuthLocalDataSource {
  Future<void> insertTokenToCache({required String token});
  void getTokenFromCache({required String token});
 bool haveToken({required String token});
}

class AuthLocalDataSource extends BaseAuthLocalDataSource{
  
  @override
  void getTokenFromCache({required String token}) {
    token = Cache.getcache(key: 'token');
  }

  @override
 bool haveToken({required String token}) {
    if( token==""){
      return false;
    }
    return true;
  }

  @override
  Future<void> insertTokenToCache({required String token}) async{
       await Cache.insertcache(key: 'token', value: token);

  }
}