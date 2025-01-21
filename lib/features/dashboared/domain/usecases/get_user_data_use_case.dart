import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_user_repo.dart';

class GetUserDataUseCase implements BaseUseCaseWithoutParameters<User> {
  final BaseUserRepo baseUserRepo;

  GetUserDataUseCase(this.baseUserRepo);
  @override
  Future<Either<Failure, User>> call() async {
    return await baseUserRepo.getUserData();
  }
}
