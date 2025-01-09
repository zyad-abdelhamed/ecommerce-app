import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/features/auth/domain/entities/auth.dart';
import 'package:ecommerce_application/features/dashboared/data/model/banner_model.dart';
import 'package:ecommerce_application/features/dashboared/data/model/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getDataBanner();
  Future<List<ProductModel>> getProducts({required int? categoryId});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BannerModel>> getDataBanner() async {
    Map<String, dynamic> responseBody =
        await apiService.get(url: ApiConstant.getBannerEndPoint);
    if (responseBody['status'] == true) {
      return List<BannerModel>.from(
          (responseBody['data'] as List).map((e) => BannerModel.fromJson(e)));
    } else {
      throw const ServerException(message: 'NO Data');
    }
  }

  @override
  Future<List<ProductModel>> getProducts({required int? categoryId}) async {
    Map<String, dynamic> responseBody = await apiService.get(
        url: '${ApiConstant.getproductsEndPoint}$categoryId',
        headers: {"Authorization": sl.get<Auth>().token});
    if (responseBody['status'] == true) {
      return List<ProductModel>.from((responseBody['data']['data'] as List)
          .map((e) => ProductModel.fromjson(data: e)));
    } else {
      throw const ServerException(message: 'NO Data');
    }
  }
}
