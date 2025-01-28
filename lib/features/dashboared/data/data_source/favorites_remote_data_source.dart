import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/models/api_service_input_model.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/dashboared/data/model/product_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<ProductModel>> getFavorites();
  Future<Map<String, dynamic>> addAndRemoveFavourites(
      {required String productId});
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final ApiService apiService;

  FavoritesRemoteDataSourceImpl(this.apiService);
  @override
  Future<Map<String, dynamic>> addAndRemoveFavourites(
      {required String productId}) async {
    Map<String, dynamic> responseBody = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            body: {'product_id': productId},
            url: ApiConstant.favoritesEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));

    return responseBody;
  }

  @override
  Future<List<ProductModel>> getFavorites() async {
    var responseBody = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.favoritesEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    if (responseBody['status'] == true) {
      return List<ProductModel>.from((responseBody['data']['data'])
          .map((e) => ProductModel.cartandfavouritesnamedconstructor(data: e)));
    } else {
      throw const ServerException(message: "NoData");
    }
  }
}
