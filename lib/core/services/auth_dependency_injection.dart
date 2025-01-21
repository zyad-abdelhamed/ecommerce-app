import 'package:dio/dio.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce_application/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce_application/features/auth/data/repositories/auth_repository.dart';
import 'package:ecommerce_application/features/auth/domain/entities/auth.dart';
import 'package:ecommerce_application/features/auth/domain/repositories/auth.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/log_in.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/sign_up.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class AuthDependencyInjection {
  static void init() {
    //bloc
    sl.registerFactory(
      () => AuthCubit(sl(), sl()),
    );
    //usecases
    sl.registerLazySingleton(
      () => LogInUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => SignUpUseCase(sl()),
    );
    sl.registerLazySingleton<Auth>(
      () => const Auth(),
    );

    //repositories
    sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(sl(), sl()),
    );
    //data source
    sl.registerLazySingleton<BaseAuthLocalDataSource>(
        () => AuthLocalDataSource());
    sl.registerLazySingleton(
      () => Dio(),
    );
    sl.registerLazySingleton(
      () => ApiService(sl()),
    );
    sl.registerLazySingleton<BaseAuthRemteDataSource>(
      () => AuthRemteDataSource(sl()),
    );
  }
}
