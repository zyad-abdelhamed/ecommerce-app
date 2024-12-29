import 'package:dartz/dartz.dart';
<<<<<<< HEAD
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/utils/base_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
=======
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/auth/domain/repositories/auth.dart';

>>>>>>> bd02c23b247ccc1e1b4ae0d864de080257f54aa9
import 'package:equatable/equatable.dart';

class SignUpUseCase extends BaseUseCaseWithParameters<Unit, SignUpParameters> {
  final BaseAuthRepository baseAuthRepository;

  SignUpUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, Unit>> call(SignUpParameters parameters) async {
    return await baseAuthRepository.signUp(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String email;
  final String userName;
  final String password;
  final String phoneNumber;

  const SignUpParameters(
      {required this.email,
      required this.userName,
      required this.password,
      required this.phoneNumber});

  @override
  List<Object?> get props => [email, userName, password, phoneNumber];
}
