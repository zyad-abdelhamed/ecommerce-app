import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/services/shared.dart';
import 'package:ecommerce_application/features/dashboared/data/model/user_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';

abstract class BaseUserLocalDataSource {
  Future<User>? getCachedUserData();
  Future<Unit> cacheUserData(User post);
}

class UserLocalDataSource implements BaseUserLocalDataSource {
  @override
  Future<Unit> cacheUserData(User user) {
    Map<String,dynamic> userToJson = user.toJson();

    Cache.insertcache(
        key: "CACHED_user_data", value: json.encode(userToJson));
    return Future.value(unit);
  }

  @override
  Future<User>? getCachedUserData() {
    final jsonString = Cache.getcache(key: "CACHED_user_data") ?? '';
    User jsonToUser = UserModel.formJson(data: json.decode(jsonString));

    return Future.value(jsonToUser);
  }
}
