import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:equatable/equatable.dart';

import '../repositories/auth.dart';

class LogInUseCase extends BaseUseCaseWithParameters<Unit, LogInParameters> {
  final BaseAuthRepository baseAuthRepository;
  LogInUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, Unit>> call(LogInParameters parameters) async {
    return await baseAuthRepository.login(parameters);
  }
}

class LogInParameters extends Equatable {
  final String email;
  final String password;

  const LogInParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}