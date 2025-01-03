import 'package:ecommerce_application/features/dashboared/data/data_source/dashboard_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/banner_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_banner_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/banner_use_case.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt dsl = GetIt.instance;

class DashboardDebendencyInjection {
  static void init() {
    //bloc
    dsl.registerFactory(() => DashboardBloc(dsl()));
    //usecases
    dsl.registerLazySingleton(() => BannerUseCase(dsl()));

    //repositories
    dsl.registerLazySingleton<BaseBannerRepo>(() => BannerRepo(dsl()));
    //datasource
    dsl.registerLazySingleton<DashboardRemoteDataSource>(
        () => RemoteDataSourceImpl());
  }
}
