import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/favorites_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_favorites_repo.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';

class FavoritesRepo extends BaseFavoritesRepo{
  final FavoritesRemoteDataSource favoritesRemoteDataSource;

  FavoritesRepo(this.favoritesRemoteDataSource);
  @override
  Future<Either<Failure, Unit>> addAndRemoveFavourites({required String productId}) async{
    Map<String, dynamic> responseBody = await favoritesRemoteDataSource.addAndRemoveFavourites(productId: productId);
    if(responseBody['status']==true){
    if(ProductCubit.favoritesProductsId.contains(productId)){
      ProductCubit.favoritesProductsId.remove(productId);
    }else{
      ProductCubit.favoritesProductsId.add(productId);
    }
    // await getFavouritesData();
    return right(unit);
  }else{
    return left(ServerFailure(message: responseBody['message']));
  }
  }

  @override
  Future<Either<Failure, List<Product>>> getFavorites() {
    // TODO: implement getFavorites
    throw UnimplementedError();
  }
}