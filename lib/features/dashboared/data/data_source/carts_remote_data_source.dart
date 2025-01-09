import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/dashboared/data/model/product_model.dart';

abstract class CartsRemoteDataSource {
  Future<List<ProductModel>> getCarts();
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
}
