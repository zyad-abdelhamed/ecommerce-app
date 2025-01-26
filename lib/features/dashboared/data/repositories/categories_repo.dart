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
    try{
    List<Category> cachedcategories = baseCategoriesLocalDataSource.getCacheCategoriesData();
    if(cachedcategories.isNotEmpty){
return right(cachedcategories);//return cached data
    }
     List<Category> remotecategories = await categoriesRemoteDataSource.getCategories();
      await baseCategoriesLocalDataSource.cacheCategoriesData(
          categories: remotecategories);
      return Right(remotecategories);//return remote data
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
