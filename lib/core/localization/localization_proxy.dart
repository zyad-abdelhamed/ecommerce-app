import 'dart:convert';

import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:flutter/services.dart';

abstract class BaseLocalization {
  String language = 'en';
  TextDirection getDirectionality();
  Map<String, dynamic> localization = {};
  Future<void> loadlang();
  Future<void> convertToArabic();
  Future<void> convertToEnglish();
  bool isarabic();
  Future<void> getLanguage();
  String getCurrentLanguage();
}

class LocalizationImpl extends BaseLocalization {
  final BaseCache baseCache;

  LocalizationImpl(this.baseCache);
  @override
  Future<void> loadlang() async {
    await baseCache.insertStringToCache(
        key: CacheConstants.languageKey, value: language);
    String root = await rootBundle
        .loadString("lib/core/localization/languages/$language.json");
    localization = json.decode(root);
  }

  @override
  Future<void> convertToArabic() async {
    language = 'ar';
    getDirectionality();
    await loadlang();
  }

  @override
  Future<void> convertToEnglish() async {
    language = 'en';
    getDirectionality();
    await loadlang();
  }

  @override
  bool isarabic() {
    return language == 'ar';
  }

  @override
  Future<void> getLanguage() async {
    language =
        baseCache.getStringFromCache(key: CacheConstants.languageKey) ?? "en";
    await loadlang();
  }

  @override
  String getCurrentLanguage() {
    return baseCache.getStringFromCache(key: CacheConstants.languageKey) ??
        "ar";
  }

  @override
  TextDirection getDirectionality() {
    return isarabic() ? TextDirection.rtl : TextDirection.ltr;
  }
}
