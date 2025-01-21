import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/category.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_category_repo.dart';

class CategoriesRepo extends BaseCategoryRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepo(this.categoriesRemoteDataSource);
  @override
  Future<Either<Failure, List<Categories>>> getCategories() async {
    try {
      List<Categories> categories =
          await categoriesRemoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
