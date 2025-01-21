import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';

abstract class BaseFavoritesRepo {
  Future<Either<Failure, List<Product>>> getFavorites();
  Future<Either<Failure, Unit>> addAndRemoveFavourites(
      {required String productId});
}
