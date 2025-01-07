import 'package:dartz/dartz.dart';
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
    // if(favoritesId.contains(productId)){
    //   favoritesId.remove(productId);
    // }else{
    //   favoritesId.add(productId);
    // }
    // await getFavouritesData();
    return right(unit);
  }else{
    return left(ServerFailure(message: ''));
  }
  }

  @override
  Future<Either<Failure, List<Product>>> getFavorites() {
    // TODO: implement getFavorites
    throw UnimplementedError();
  }
}