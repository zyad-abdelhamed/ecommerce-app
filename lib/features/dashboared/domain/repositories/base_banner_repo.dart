import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';

abstract class BaseBannerRepo {
  Future<Either<Failure, List<Banners>>> getDataBanner();
}
