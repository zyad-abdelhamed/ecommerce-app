import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/models/api_service_input_model.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/dashboared/data/model/product_model.dart';

abstract class CartsRemoteDataSource {
  Future<List<ProductModel>> getCarts();
  Future<Unit> addOrRemoveProductFromCart({required String productId});
}

class CartsRemoteDataSourceImpl extends CartsRemoteDataSource {
  ApiService apiService;
  CartsRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ProductModel>> getCarts() async {
    Map<String, dynamic> responseBody = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.cartsEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));

    return List<ProductModel>.from((responseBody['data']['cart_items'])
        .map((e) => ProductModel.cartandfavouritesnamedconstructor(data: e)));
  }

  @override
  Future<Unit> addOrRemoveProductFromCart({required String productId}) async {
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            body: {'product_id': productId},
            url: ApiConstant.cartsEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));

    return unit;
  }
}
