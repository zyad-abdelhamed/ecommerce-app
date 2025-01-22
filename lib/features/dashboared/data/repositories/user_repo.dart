import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/user_local_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/user_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/model/user_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/address.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_user_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_address_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/change_password_use_case.dart';

class UserRepo implements BaseUserRepo {
  final BaseUserRemoteDataSource baseUserRemoteDataSource;
  final BaseUserLocalDataSource baseUserLocalDataSource;

  UserRepo(this.baseUserRemoteDataSource, this.baseUserLocalDataSource);
  @override
  Future<Either<Failure, User>> getUserData() async {
    try {
      User localUserData = await baseUserLocalDataSource.getCachedUserData();
      return right(localUserData);
      UserModel remoteUserData = await baseUserRemoteDataSource.getUserData();
      await baseUserLocalDataSource.cacheUserData(remoteUserData);

      return right(remoteUserData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await baseUserRemoteDataSource.signOut();
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword(
      ChangePasswordParameters parameters) async {
    try {
      await baseUserRemoteDataSource.changePassword(parameters);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> addAddress(
      AddAddressParameters addAddressParameters) async {
    try {
      await baseUserRemoteDataSource.addAddress(addAddressParameters);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getaddress() async {
    try {
      List<AddressEntity> result = await baseUserRemoteDataSource.getAddress();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
