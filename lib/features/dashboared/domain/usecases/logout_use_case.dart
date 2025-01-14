import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_user_repo.dart';

class LogoutUseCase extends BaseUseCaseWithoutParameters<Unit> {
  final BaseUserRepo baseUserRepo;

  LogoutUseCase(this.baseUserRepo);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await baseUserRepo.signOut();
  }
}
