import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_cart_repo.dart';

class AddOrRemoveProductFromCart
    extends BaseUseCaseWithParameters<Unit, String> {
  final BaseCartRepo baseCartRepo;
  AddOrRemoveProductFromCart(this.baseCartRepo);
  @override
  Future<Either<Failure, Unit>> call({required String parameters}) async {
    return await baseCartRepo.addOrRemoveProductFromCart(productId: parameters);
  }
}
