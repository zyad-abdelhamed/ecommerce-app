import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

abstract class BaseUseCaseWithParameters<t, parameters> {
  Future<Either<Failure, t>> call(parameters parameters);
}


abstract class BaseUseCaseWithoutParameters<t> {
  Future<Either<Failure, t>> call();
}