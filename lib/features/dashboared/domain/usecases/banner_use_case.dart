import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_home_repo.dart';

class BannerUseCase extends BaseUseCaseWithoutParameters<List<Banners>>{
  final BaseHomeRepo homeRepo;
  BannerUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<Banners>>> call()async{
  return await homeRepo.getDataBanner();
  }
}