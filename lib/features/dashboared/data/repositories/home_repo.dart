import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';

import '../../domain/repositories/base_home_repo.dart';

class HomeRepo extends BaseHomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepo(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<Banners>>> getDataBanner() async {
    try {
      List<Banners> banners = await homeRemoteDataSource.getDataBanner();
      return Right(banners);
    }  catch (e) {
  if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
}
  }

  @override
  Future<Either<Failure, List<Product>>> getproducts({required int? categoryId}) async{
     try {
      List<Product> products = await homeRemoteDataSource.getProducts(categoryId: categoryId);
      return Right(products);
    }  catch (e) {
  if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
}
  }
}
