import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/carts_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/categories_local_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/user_local_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/user_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/carts_repo.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/categories_repo.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/home_repo.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/user_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_cart_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_category_repo.dart';
import 'package:ecommerce_application/features/dashboared/data/data_source/favorites_remote_data_source.dart';
import 'package:ecommerce_application/features/dashboared/data/repositories/favorites_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_favorites_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/repositories/base_user_repo.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_address_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_and_remove_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_or_remove_product_from_cart.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/banner_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/change_password_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_address_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_carts_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_categories_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_products_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_user_data_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/logout_use_case.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/categories_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/search_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import '../../../features/dashboared/domain/repositories/base_home_repo.dart';

class DashboardDebendencyInjection {
  static void init() {
    //bloc
    sl.registerFactory(() => CategoriesCubit(sl(), sl()));
    sl.registerFactory(() => DashboardBloc(sl()));
    sl.registerFactory<ProductCubit>(
      () => ProductCubit(sl(), sl(), sl(), sl(), sl()),
    );
    sl.registerLazySingleton<FavoriteIconController>(
      () => FavoriteIconController(),
    );
    sl.registerFactory<UserCubit>(
      () => UserCubit(sl(), sl(), sl()),
    );
    sl.registerFactory(
      () => SearchCubit(sl()),
    );
    sl.registerLazySingleton(
      () => const ProductState(),
    );
    sl.registerFactory<AddressCubit>(
      () => AddressCubit(sl(), sl()),
    );
    //usecases
    sl.registerLazySingleton(() => AddOrRemoveProductFromCart(sl()));
    sl.registerLazySingleton(() => GetCartsUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton(
      () => GetFavoritesUseCase(sl()),
    );
    //usecases
    sl.registerLazySingleton<AddAndRemoveFavoritesUseCase>(
      () => AddAndRemoveFavoritesUseCase(sl()),
    );
    sl.registerLazySingleton(() => BannerUseCase(sl()));
    sl.registerLazySingleton(
      () => GetProductsUseCase(sl()),
    );
    sl.registerLazySingleton<GetUserDataUseCase>(
      () => GetUserDataUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => LogoutUseCase(sl()),
    );
    sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
    sl.registerLazySingleton<GetAddressUseCase>(
      () => GetAddressUseCase(sl()),
    );
    sl.registerLazySingleton<AddAddressUseCase>(
      () => AddAddressUseCase(sl()),
    );
    //repositories
    sl.registerLazySingleton<BaseCartRepo>(() => CartsRepo(sl()));
    sl.registerLazySingleton<BaseCategoryRepo>(
        () => CategoriesRepo(sl(), sl()));
    sl.registerLazySingleton<BaseHomeRepo>(() => HomeRepo(sl()));
    sl.registerLazySingleton<BaseUserRepo>(
      () => UserRepo(sl(), sl()),
    );
    //datasource
    sl.registerLazySingleton<CategoriesRemoteDataSource>(
        () => CategoriesRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<BaseFavoritesRepo>(
      () => FavoritesRepo(sl()),
    );

    ///datasource
    //remote
    sl.registerLazySingleton<CartsRemoteDataSource>(
        () => CartsRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<FavoritesRemoteDataSource>(
      () => FavoritesRemoteDataSourceImpl(sl()),
    );
    sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
      () => UserRemoteDataSource(sl()),
    );
    //local
    sl.registerLazySingleton<BaseUserLocalDataSource>(
      () => UserLocalDataSource(),
    );
    sl.registerLazySingleton<BaseCategoriesLocalDataSource>(
      () => CategoriesLocalDataSourceImplBySharedPreferences(),
    );
  }
}
