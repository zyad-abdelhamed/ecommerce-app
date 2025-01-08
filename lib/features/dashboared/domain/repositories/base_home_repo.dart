import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure,List<Banners>>> getDataBanner();
  Future<Either<Failure, List<Product>>> getproducts({required int? categoryId});
}