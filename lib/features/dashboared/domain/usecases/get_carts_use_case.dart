import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_cart_repo.dart';

class GetCartsUseCase extends BaseUseCaseWithoutParameters<List<Product>> {
  final BaseCartRepo baseCartRepo;
  GetCartsUseCase(this.baseCartRepo);
  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await baseCartRepo.getCarts();
  }
}
