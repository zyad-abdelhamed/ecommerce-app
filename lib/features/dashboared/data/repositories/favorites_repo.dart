import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/favorites_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_favorites_repo.dart';

class FavoritesRepo extends BaseFavoritesRepo {
  final FavoritesRemoteDataSource favoritesRemoteDataSource;

  FavoritesRepo(this.favoritesRemoteDataSource);
  @override
  Future<Either<Failure, Unit>> addAndRemoveFavourites(
      {required String productId}) async {
    try {
      await favoritesRemoteDataSource.addAndRemoveFavourites(
          productId: productId);
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getFavorites() async {
    try {
      List<Product> categories = await favoritesRemoteDataSource.getFavorites();
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
