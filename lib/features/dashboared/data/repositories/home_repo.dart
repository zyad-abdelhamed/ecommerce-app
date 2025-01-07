import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
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
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getproducts() async{
     try {
      List<Product> banners = await homeRemoteDataSource.getProducts();
      return Right(banners);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
