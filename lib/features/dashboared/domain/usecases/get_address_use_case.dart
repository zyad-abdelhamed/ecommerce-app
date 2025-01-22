import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/address.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_user_repo.dart';

class GetAddressUseCase extends BaseUseCaseWithoutParameters<List<AddressEntity>> {
  final BaseUserRepo baseUserRepo;
  GetAddressUseCase(this.baseUserRepo);
  @override
  Future<Either<Failure, List<AddressEntity>>> call() async {
    return await baseUserRepo.getaddress();
  }
}
