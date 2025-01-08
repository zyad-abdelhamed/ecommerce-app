import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/category.dart';

abstract class BaseCategoryRepo {
  Future<Either<Failure, List<Categories>>> getCategories();
}
