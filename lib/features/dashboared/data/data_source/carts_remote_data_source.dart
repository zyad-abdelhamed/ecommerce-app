import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
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
        headers: {'Authorization': ApiConstant.token},
        url: ApiConstant.cartsEndPoint);
    if (responseBody['status'] == true) {
      return List<ProductModel>.from((responseBody['data']['cart_items'])
          .map((e) => ProductModel.cartandfavouritesnamedconstructor(data: e)));
    } else {
      throw const ServerException(message: 'NoData');
    }
  }

  @override
  Future<Unit> addOrRemoveProductFromCart({required String productId}) async {
    Map<String, dynamic> responseBody = await apiService.post(
        body: {'product_id': productId},
        url: ApiConstant.cartsEndPoint,
        headers: {'Authorization': ApiConstant.token});
    if (responseBody['status'] == false) {
      throw ServerException(message: responseBody['message']);
    }
    return unit;
  }
}
