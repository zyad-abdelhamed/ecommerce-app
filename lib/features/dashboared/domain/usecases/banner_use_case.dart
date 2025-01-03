import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/base_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_banner_repo.dart';

class BannerUseCase extends BaseUseCaseWithoutParameters<List<Banners>>{
  final BaseBannerRepo bannerRepo;
  BannerUseCase(this.bannerRepo);
  @override
  Future<Either<Failure, List<Banners>>> call()async{
  return await bannerRepo.getDataBanner();
  }
}