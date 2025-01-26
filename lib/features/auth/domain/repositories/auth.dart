import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/auth/data/models/sign_in_input_model.dart';
import 'package:ecommerce_application/features/auth/data/models/sign_up_model.dart';
import 'package:ecommerce_application/features/auth/domain/entities/auth.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, Unit>> signUp(SignUpModel signUpModel);
  Future<Either<Failure, Auth>> login(LogInInputModel logInInputModel);
}
