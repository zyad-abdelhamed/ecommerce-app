import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/models/api_service_input_model.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/dashboared/data/model/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  final ApiService apiService;
  CategoriesRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<CategoryModel>> getCategories() async {
    Map<String, dynamic> responseBody = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.categoriesEndPoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithoutToken));
    
      return List<CategoryModel>.from((responseBody['data']['data'])
          .map((e) => CategoryModel.fromjson(e)));
    
  }
}
