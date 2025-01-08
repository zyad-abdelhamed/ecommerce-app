import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/category.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_category_repo.dart';

class GetCategoriesUseCase
    extends BaseUseCaseWithoutParameters<List<Categories>> {
  BaseCategoryRepo baseCategoryRepo;
  GetCategoriesUseCase(this.baseCategoryRepo);
  @override
  Future<Either<Failure, List<Categories>>> call() async {
    return await baseCategoryRepo.getCategories();
  }
}
