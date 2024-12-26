import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/sign_up.dart';
abstract class BaseAuthRepository {
Future<Either<Failure,Unit>> signUp(SignUpParameters signUpParameters);
}

