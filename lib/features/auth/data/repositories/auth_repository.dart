import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce_application/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce_application/features/auth/data/models/sign_in_input_model.dart';
import 'package:ecommerce_application/features/auth/data/models/sign_up_model.dart';
import 'package:ecommerce_application/features/auth/domain/entities/auth.dart';
import 'package:ecommerce_application/features/auth/domain/repositories/auth.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemteDataSource baseAuthRemteDataSource;
  final BaseAuthLocalDataSource baseAuthLocalDataSource;
  AuthRepository(this.baseAuthRemteDataSource, this.baseAuthLocalDataSource);

  @override
  Future<Either<Failure, Unit>> signUp(
      SignUpModel signUpModel) async {
    try {
      await baseAuthRemteDataSource.signUp(signUpModel);
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Auth>> login(LogInInputModel logInInputModel) async {
    try {
      final Auth result = await baseAuthRemteDataSource.login(logInInputModel);
      // baseAuthLocalDataSource.insertTokenToCache(token: result.token!);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
