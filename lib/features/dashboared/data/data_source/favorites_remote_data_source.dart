import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/features/auth/domain/entities/auth.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<Product>> getFavorites();
  Future<Map<String, dynamic>> addAndRemoveFavourites({required String productId});
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final ApiService apiService;

  FavoritesRemoteDataSourceImpl(this.apiService);
  @override
  Future<Map<String, dynamic>> addAndRemoveFavourites({required String productId}) async {
   Map<String, dynamic> responseBody = await apiService.post(
        body: {'product_id': productId},
        url: ApiConstant.favoritesEndPoint,
        headers: {"Authorization": ApiConstant.token});

return responseBody;
  }

  @override
  Future<List<Product>> getFavorites() {
    // TODO: implement getFavorites
    throw UnimplementedError();
  }
}
