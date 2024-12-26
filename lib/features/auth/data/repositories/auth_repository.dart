import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/data/datasources/auth_remte_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/sign_up.dart';

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
}
