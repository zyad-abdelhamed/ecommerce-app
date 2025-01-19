import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_user_repo.dart';
import 'package:equatable/equatable.dart';

class ChangePasswordUseCase
    extends BaseUseCaseWithParameters<Unit, ChangePasswordParameters> {
  BaseUserRepo baseUserRepo;
  ChangePasswordUseCase(this.baseUserRepo);
  @override
  Future<Either<Failure, Unit>> call(
      {required ChangePasswordParameters parameters}) async {
    return await baseUserRepo.changePassword(parameters);
  }
}

class ChangePasswordParameters extends Equatable {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParameters(
      {required this.currentPassword, required this.newPassword});
  @override
  List<Object?> get props => [currentPassword, newPassword];
}
