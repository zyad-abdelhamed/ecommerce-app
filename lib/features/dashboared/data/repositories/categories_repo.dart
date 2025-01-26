import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/categories_local_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/category.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_category_repo.dart';

class CategoriesRepo extends BaseCategoryRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  final BaseCategoriesLocalDataSource baseCategoriesLocalDataSource;
  CategoriesRepo(
      this.categoriesRemoteDataSource, this.baseCategoriesLocalDataSource);
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    List<Category> categories;
    try {
      if (baseCategoriesLocalDataSource.getCacheCategoriesData() != null) {
        categories = baseCategoriesLocalDataSource.getCacheCategoriesData()!;
        return right(categories);
      }
      categories = await categoriesRemoteDataSource.getCategories();
      await baseCategoriesLocalDataSource.cacheCategoriesData(
          categories: categories);
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
