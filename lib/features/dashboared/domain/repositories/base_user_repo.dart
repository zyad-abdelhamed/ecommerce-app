import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';

abstract class BaseUserRepo {
  Future<Either<Failure,User>> getUserData();
  Future<Either<Failure, Unit>> signOut();
}