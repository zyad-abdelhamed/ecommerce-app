import 'dart:convert';

import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:flutter/services.dart';

abstract class LocalizationProxy {
  Future<void> loadlang();
  Future<void> convertToArabic();
  Future<void> convertToEnglish();
}

class LocalizationProxyImpl extends LocalizationProxy {
  static String language = 'ar';

  Map<String, dynamic> localization = {};
  @override
  Future<void> loadlang() async {
    await sl<CacheProxy>().insertStringToCache(key: 'lang', value: language);
    String root = await rootBundle.loadString("assets/lang/$language.json");
    localization = json.decode(root);
  }

  @override
  Future<void> convertToArabic() async {
    if (language == 'en') {
      language = 'ar';

      await loadlang();
    }
  }

  @override
  Future<void> convertToEnglish() async {
    if (language == 'ar') {
      language = 'en';

      await loadlang();
    }
  }

  bool isarabic() {
    return language == 'ar';
  }
}
