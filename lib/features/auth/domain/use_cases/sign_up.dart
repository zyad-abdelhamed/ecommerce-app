import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/auth/data/models/sign_up_model.dart';
import 'package:ecommerce_application/features/auth/domain/repositories/auth.dart';

class SignUpUseCase extends BaseUseCaseWithParameters<Unit, SignUpModel> {
  final BaseAuthRepository baseAuthRepository;

  SignUpUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, Unit>> call(
      {required SignUpModel parameters}) async {
    return await baseAuthRepository.signUp(parameters);
  }
}


