import 'dart:convert';

import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/services/shared.dart';
import 'package:ecommerce_application/features/dashboared/data/model/category_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/category.dart';

abstract class BaseCategoriesLocalDataSource {
  Future<void> cacheCategoriesData({required List<Category> categories});
  List<Category> getCacheCategoriesData();
}

class CategoriesLocalDataSourceImplBySharedPreferences
    extends BaseCategoriesLocalDataSource {
  @override
  Future<void> cacheCategoriesData({required List<Category> categories}) async {
    List<Map<String, dynamic>> categoriesDataToJson = categories
        .map<Map<String, dynamic>>((remoteCategory) => remoteCategory.toJson())
        .toList();
    await Cache.insertcache(
        key: CacheConstants.categoriesDataKey,
        value: json.encode(categoriesDataToJson));
  }

  @override
  List<Category> getCacheCategoriesData() {
    final String categoriesDataCachedString =
        Cache.getcache(key: CacheConstants.categoriesDataKey) ?? '';

    List<dynamic> jsonCategoriesData = json.decode(categoriesDataCachedString);
    List<Category> cachedCategories = jsonCategoriesData
        .map<Category>(
          (e) => CategoryModel.fromjson(e),
        )
        .toList();
    return cachedCategories;
  }
}
