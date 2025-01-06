import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_home_repo.dart';

class GetProductsUseCase extends BaseUseCaseWithoutParameters<List<Product>>{
  final BaseHomeRepo baseHomeRepo;

  GetProductsUseCase(this.baseHomeRepo);

  @override
  Future<Either<Failure, List<Product>>> call() async{
  return await baseHomeRepo.getproducts();
  }
 
}