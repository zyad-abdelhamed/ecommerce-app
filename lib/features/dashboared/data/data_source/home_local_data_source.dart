import 'dart:convert';

import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/features/dashboared/data/model/banner_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';

abstract class BaseHomeLocalDataSource {
  List<BannerModel>? getCachedBanners();
  Future<void> setCachedBanners(List<Banners> banners);
}

class HomeLocalDataSourceImpl implements BaseHomeLocalDataSource {
  @override
  List<BannerModel>? getCachedBanners() {
    var json =
        sl<BaseCache>().getStringFromCache(key: CacheConstants.bannerDataKey);
    if (json == null) {
      return null;
    }
    var jsonDecoded = jsonDecode(json);
    return List<BannerModel>.from(
        jsonDecoded.map((e) => BannerModel.fromJson(e)));
  }

  @override
  Future<void> setCachedBanners(List<Banners> banners) async {
    List<Map<String, dynamic>> bannerJson =
        banners.map((e) => e.toJson()).toList();
    await sl<BaseCache>().insertStringToCache(
        key: CacheConstants.bannerDataKey, value: json.encode(bannerJson));
  }
}
