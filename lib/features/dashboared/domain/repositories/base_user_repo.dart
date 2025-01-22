import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/address.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_address_use_case.dart';

import '../usecases/change_password_use_case.dart';

abstract class BaseUserRepo {
  Future<Either<Failure, User>> getUserData();
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, Unit>> changePassword(
      ChangePasswordParameters parameters);
  Future<Either<Failure, List<AddressEntity>>> getaddress();
  Future<Either<Failure, Unit>> addAddress(
      AddAddressParameters addAddressParameters);
}
