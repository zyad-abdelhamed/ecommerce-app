import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/favorites_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_favorites_repo.dart';

class FavoritesRepo extends BaseFavoritesRepo{
  final FavoritesRemoteDataSource favoritesRemoteDataSource;

  FavoritesRepo(this.favoritesRemoteDataSource);
  @override
  Future<Either<Failure, Unit>> addAndRemoveFavourites({required String productId}) async{
    Map<String, dynamic> responseBody = await favoritesRemoteDataSource.addAndRemoveFavourites(productId: productId);
    if(responseBody['status']==true){
    
    // await getFavouritesData();
    return right(unit);
  }else{
    return left(ServerFailure(message: responseBody['message']));
  }
  }

  @override
  Future<Either<Failure, List<Product>>> getFavorites() async{
    try {
      List<Product> categories =
          await favoritesRemoteDataSource.getFavorites();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}