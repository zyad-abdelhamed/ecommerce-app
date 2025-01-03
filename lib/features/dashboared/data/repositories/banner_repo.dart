import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/dashboard_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_banner_repo.dart';

class BannerRepo extends BaseBannerRepo {
  final DashboardRemoteDataSource remoteDataSource;
  BannerRepo(this.remoteDataSource);
  @override
  Future<Either<Failure, List<Banners>>> getDataBanner() async {
    try {
      final result = await remoteDataSource.getDataBanner();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
