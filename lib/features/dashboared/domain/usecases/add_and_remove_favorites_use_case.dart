import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_favorites_repo.dart';

class AddAndRemoveFavoritesUseCase
    extends BaseUseCaseWithParameters<Unit, String> {
  final BaseFavoritesRepo baseFavoritesRepo;

  AddAndRemoveFavoritesUseCase(this.baseFavoritesRepo);
  @override
  Future<Either<Failure, Unit>> call({required String parameters}) async {
    return await baseFavoritesRepo.addAndRemoveFavourites(
        productId: parameters);
  }
}
