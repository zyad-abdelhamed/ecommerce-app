import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/auth/data/models/sign_in_input_model.dart';
import 'package:ecommerce_application/features/auth/domain/entities/auth.dart';

import '../repositories/auth.dart';

class LogInUseCase extends BaseUseCaseWithParameters<Auth, LogInInputModel> {
  final BaseAuthRepository baseAuthRepository;
  LogInUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, Auth>> call(
      {required LogInInputModel parameters}) async {
    return await baseAuthRepository.login(parameters);
  }
}


