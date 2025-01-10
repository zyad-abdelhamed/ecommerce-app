import 'package:ecommerce_application/features/dashboared/data/data_source/carts_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/carts_repo.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/categories_repo.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/home_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_cart_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_category_repo.dart';
import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/favorites_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/favorites_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_favorites_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_and_remove_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_or_remove_product_from_cart.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/banner_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_carts_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_categories_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_products_use_case.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/cart_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/categories_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/dashboared/domain/repositories/base_home_repo.dart';

GetIt dsl = GetIt.instance;

class DashboardDebendencyInjection {
  static void init() {
    //bloc
    dsl.registerFactory(() => CartCubit(dsl(), dsl()));
  
    dsl.registerFactory(() => CategoriesCubit(dsl(), dsl()));
    dsl.registerFactory(() => DashboardBloc(dsl()));
    dsl.registerFactory<ProductCubit>(
      () => ProductCubit(dsl(), dsl(),dsl()),
    );
    dsl.registerLazySingleton<FavoriteIconController>(() => FavoriteIconController(),);
    //usecases
    dsl.registerLazySingleton(() => AddOrRemoveProductFromCart(dsl()));
    dsl.registerLazySingleton(() => GetCartsUseCase(dsl()));
    dsl.registerLazySingleton(() => GetCategoriesUseCase(dsl()));
    dsl.registerLazySingleton(() => GetFavoritesUseCase(dsl()),);
    


    
    //usecases
    dsl.registerLazySingleton<AddAndRemoveFavoritesUseCase>(
      () => AddAndRemoveFavoritesUseCase(dsl()),
    );
    dsl.registerLazySingleton(() => BannerUseCase(dsl()));
    dsl.registerLazySingleton(
      () => GetProductsUseCase(dsl()),
    );
    //repositories
    dsl.registerLazySingleton<BaseCartRepo>(() => CartsRepo(dsl()));
    dsl.registerLazySingleton<BaseCategoryRepo>(() => CategoriesRepo(dsl()));
    dsl.registerLazySingleton<BaseHomeRepo>(() => HomeRepo(dsl()));
    //datasource

    dsl.registerLazySingleton<CategoriesRemoteDataSource>(
        () => CategoriesRemoteDataSourceImpl(dsl()));
    dsl.registerLazySingleton<BaseFavoritesRepo>(
      () => FavoritesRepo(dsl()),
    );

    //datasource
    dsl.registerLazySingleton<CartsRemoteDataSource>(
        () => CartsRemoteDataSourceImpl(dsl()));
    dsl.registerLazySingleton<FavoritesRemoteDataSource>(
      () => FavoritesRemoteDataSourceImpl(sl()),
    );
    dsl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(dsl()));
  }
}
