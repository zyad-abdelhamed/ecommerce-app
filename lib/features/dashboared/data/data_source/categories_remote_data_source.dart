import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/dashboared/data/model/categories_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoriesModel>> getCategories();
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  final ApiService apiService;
  CategoriesRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<CategoriesModel>> getCategories() async {
    Map<String, dynamic> responseBody = await apiService.get(
        apiServiceInputModel:
            ApiServiceInputModel(url: ApiConstant.categoriesEndPoint));
    if (responseBody['status'] == true) {
      return List<CategoriesModel>.from((responseBody['data']['data'])
          .map((e) => CategoriesModel.fromjson(e)));
    } else {
      throw const ServerException(message: "NoData");
    }
  }
}
