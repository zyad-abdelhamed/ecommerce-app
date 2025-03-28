import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';

import '../repositories/base_home_repo.dart';

class GetProductsUseCase
    extends BaseUseCaseWithParameters<List<Product>, int?> {
  final BaseHomeRepo baseHomeRepo;

  GetProductsUseCase(this.baseHomeRepo);

  @override
  Future<Either<Failure, List<Product>>> call(
      {required int? parameters}) async {
    return await baseHomeRepo.getproducts(categoryId: parameters);
  }
}
