import 'dart:convert';

import 'package:ecommerce_application/core/services/shared.dart';
import 'package:flutter/services.dart';

class LocalizationProxy {
  static String language = 'ar';

  Map<String, dynamic> localization = {};
  Future<void> loadlang() async {
    await Cache.insertcache(key: 'lang', value: language);
    String root = await rootBundle.loadString("assets/lang/$language.json");
    localization = json.decode(root);
  }

  Future<void> convertToArabic() async {
    if (language == 'en') {
      language = 'ar';

      await loadlang();
    }
  }

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
