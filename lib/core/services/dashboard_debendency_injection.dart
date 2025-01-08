import 'package:ecommerce_application/features/dashboared/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/categories_repo.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/home_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_category_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/banner_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_categories_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_products_use_case.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/categories_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/dashboared/domain/repositories/base_home_repo.dart';

GetIt dsl = GetIt.instance;

class DashboardDebendencyInjection {
  static void init() {
    //bloc
    dsl.registerFactory(() => CategoriesCubit(dsl()));
    dsl.registerFactory(() => DashboardBloc(dsl()));
    dsl.registerFactory(
      () => ProductCubit(dsl()),
    );
    //usecases
    dsl.registerLazySingleton(() => GetCategoriesUseCase(dsl()));
    dsl.registerLazySingleton(() => BannerUseCase(dsl()));
    dsl.registerLazySingleton(
      () => GetProductsUseCase(dsl()),
    );
    //repositories
    dsl.registerLazySingleton<BaseCategoryRepo>(() => CategoriesRepo(dsl()));
    dsl.registerLazySingleton<BaseHomeRepo>(() => HomeRepo(dsl()));
    //datasource
    
  
    dsl.registerLazySingleton<CategoriesRemoteDataSource>(
        () => CategoriesRemoteDataSourceImpl(dsl()));
    dsl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(dsl()));
  }
}
