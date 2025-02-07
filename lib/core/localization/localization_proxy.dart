import 'dart:convert';

import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:flutter/services.dart';

abstract class BaseLocalizationProxy {
  Future<void> loadlang();
  Future<void> convertToArabic();
  Future<void> convertToEnglish();
  Future<void> getLanguage();
}

class LocalizationProxyImpl extends BaseLocalizationProxy {
  final BaseCache baseCache;
  static String language = 'ar';

  Map<String, dynamic> localization = {};

  LocalizationProxyImpl(this.baseCache);
  @override
  Future<void> loadlang() async {
    await baseCache.insertStringToCache(
        key: CacheConstants.languageKey, value: language);
    String root = await rootBundle.loadString("assets/lang/$language.json");
    localization = json.decode(root);
  }

  @override
  Future<void> convertToArabic() async {
    language = 'ar';

    await loadlang();
  }

  @override
  Future<void> convertToEnglish() async {
    language = 'en';

    await loadlang();
  }

  bool isarabic() {
    return language == 'ar';
  }

  @override
  Future<void> getLanguage() async {
    language =
        baseCache.getStringFromCache(key: CacheConstants.languageKey) ?? "ar";
    await loadlang();
  }
}
