import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/models/api_service_input_model.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
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
    Map<String, dynamic> responseBody = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.getBannerEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithoutToken));

    return List<BannerModel>.from(
        (responseBody['data'] as List).map((e) => BannerModel.fromJson(e)));
  }

  @override
  Future<List<ProductModel>> getProducts({required int? categoryId}) async {
    Map<String, dynamic> responseBody = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: '${ApiConstant.getproductsEndPoint}$categoryId',
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));

    return List<ProductModel>.from((responseBody['data']['data'] as List)
        .map((e) => ProductModel.fromjson(data: e)));
  }
}
