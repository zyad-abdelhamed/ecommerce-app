import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_user_repo.dart';
import 'package:equatable/equatable.dart';

class AddAddressUseCase
    extends BaseUseCaseWithParameters<Unit, AddAddressParameters> {
  BaseUserRepo baseUserRepo;
  AddAddressUseCase(this.baseUserRepo);
  @override
  Future<Either<Failure, Unit>> call({required parameters}) async {
    return await baseUserRepo.addAddress(parameters);
  }
}

class AddAddressParameters extends Equatable {
  final String name;
  final String city;
  final String region;
  final String details;

  const AddAddressParameters(
      {required this.name,
      required this.city,
      required this.region,
      required this.details});

  @override
  List<Object?> get props => [id, name, city, region, details];
}
