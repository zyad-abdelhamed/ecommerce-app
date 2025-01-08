import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';

abstract class BaseCartRepo {
  Future<Either<Failure, List<Product>>> getCarts();
}
