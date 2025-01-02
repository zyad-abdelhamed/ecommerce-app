import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce_application/features/auth/data/models/auth_model.dart';
import 'package:ecommerce_application/features/auth/domain/repositories/auth.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/log_in.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/sign_up.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemteDataSource baseAuthRemteDataSource;

  AuthRepository(this.baseAuthRemteDataSource);

  @override
  Future<Either<Failure, Unit>> signUp(
      SignUpParameters signUpParameters) async {
    try {
      await baseAuthRemteDataSource.signUp(signUpParameters);
      return right(unit);
    } on ServerException catch (failure) {
      return left(ServerFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> login(LogInParameters logInParameters) async {
    try {
    final AuthModel result = await baseAuthRemteDataSource.login(logInParameters);
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(message: failure.message));
    }
  }
}
