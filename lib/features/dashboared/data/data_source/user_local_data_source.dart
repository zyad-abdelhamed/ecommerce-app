import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/services/shared.dart';
import 'package:ecommerce_application/features/dashboared/data/model/user_model.dart';

abstract class BaseUserLocalDataSource {
  Future<UserModel> getCachedUserData();
  Future<Unit> cacheUserData(UserModel postModels);
}

class UserLocalDataSource implements BaseUserLocalDataSource {
  @override
  Future<Unit> cacheUserData(UserModel userModel) {
    var userModelToJson = userModel.toJson();

    Cache.insertcache(
        key: "CACHED_user_data", value: json.encode(userModelToJson));
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCachedUserData() {
    final jsonString = Cache.getcache(key: "CACHED_user_data");
    Map<String, dynamic> decodeJsonData = json.decode(jsonString);
    UserModel jsonToUserModel = UserModel.formJson(data: decodeJsonData);

    return Future.value(jsonToUserModel);
    }
}
