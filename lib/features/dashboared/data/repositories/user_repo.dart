import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/user_local_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/user_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/model/user_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_user_repo.dart';

class UserRepo implements BaseUserRepo {
  final BaseUserRemoteDataSource baseUserRemoteDataSource;
  final BaseUserLocalDataSource baseUserLocalDataSource;

  UserRepo(this.baseUserRemoteDataSource, this.baseUserLocalDataSource);
  @override
  Future<Either<Failure, User>> getUserData() async {
    try {
      if (await baseUserLocalDataSource.getCachedUserData() != null) {
        User localUserData = await baseUserLocalDataSource.getCachedUserData();
        return right(localUserData);
      }
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
  Future<Either<Failure, Unit>> signOut() async{
     try {
  await baseUserRemoteDataSource.signOut();
  return right(unit);
}  catch (e) {
if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));}
    
  }
}
