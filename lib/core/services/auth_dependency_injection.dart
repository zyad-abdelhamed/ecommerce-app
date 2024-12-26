import 'package:ecommerce_app/features/auth/data/datasources/auth_remte_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/sign_up.dart';
import 'package:ecommerce_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class AuthDependencyInjection {
  static void init() {
    //bloc
    sl.registerFactory(
      () => AuthCubit(sl()),
    );
    //usecases
    sl.registerLazySingleton(
      () => SignUpUseCase(sl()),
    );

    //repositories
    sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(sl()),
    );
    //data source
    sl.registerLazySingleton<BaseAuthRemteDataSource>(
      () => AuthRemteDataSource(),
    );
  }
}
