import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_favorites_repo.dart';

class GetFavoritesUseCase extends BaseUseCaseWithoutParameters<List<Product>> {
  final BaseFavoritesRepo baseFavoritesRepo;

  GetFavoritesUseCase(this.baseFavoritesRepo);
  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await baseFavoritesRepo.getFavorites();
  }
}
