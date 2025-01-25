import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static late SharedPreferences sharedPreferences;
  static Future<void> cacheintialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> insertcache(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static String? getcache({required String key}) {
    return sharedPreferences.getString(key);
  }

  static Future<bool> deletecache({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> insertIntTocache(
      {required String key, required int value}) async {
    return await sharedPreferences.setInt(key, value);
  }

  static int? getIntFromcache({required String key}) {
    return sharedPreferences.getInt(key);
  }
}
