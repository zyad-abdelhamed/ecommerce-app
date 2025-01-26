import 'dart:convert';

import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/services/shared.dart';
import 'package:ecommerce_application/features/dashboared/data/model/user_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';

abstract class BaseUserLocalDataSource {
  User? getCachedUserData();
  Future<void> cacheUserData(User post);
}

class UserLocalDataSource implements BaseUserLocalDataSource {
  @override
  Future<void> cacheUserData(User user) async {
    Map<String, dynamic> userToJson = user.toJson();

    await Cache.insertcache(
        key: CacheConstants.userDataKey, value: json.encode(userToJson));
  }

  @override
  User? getCachedUserData() {
    final String? jsonString = Cache.getcache(key: CacheConstants.userDataKey);
    if (jsonString == null) {
      return null;
    }

    User jsonToUser = UserModel.formJson(data: json.decode(jsonString));

    return jsonToUser;
  }
}
