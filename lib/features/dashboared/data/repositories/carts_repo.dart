import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/carts_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_cart_repo.dart';

class CartsRepo extends BaseCartRepo {
  final CartsRemoteDataSource cartsRemoteDataSource;
  CartsRepo(this.cartsRemoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> getCarts() async {
    try {
      List<Product> result = await cartsRemoteDataSource.getCarts();
      return Right(result);
    }  catch (e) {
  if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
}
  }

  @override
  Future<Either<Failure, Unit>> addOrRemoveProductFromCart(
      {required String productId}) async {
    try {
      var result = await cartsRemoteDataSource.addOrRemoveProductFromCart(
          productId: productId);
      return Right(result);
    }  catch (e) {
  if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
}
  }
}
