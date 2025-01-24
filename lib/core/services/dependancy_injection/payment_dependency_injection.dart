import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/services/stripe_service.dart';
import 'package:ecommerce_application/features/payment_integration/data/datasources/payment_remote_data_source.dart';
import 'package:ecommerce_application/features/payment_integration/data/repos/paymentrepo.dart';
import 'package:ecommerce_application/features/payment_integration/domain/repos/base_payment_repo.dart';
import 'package:ecommerce_application/features/payment_integration/domain/usecases/make_payment_use_case.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/controller/cubit/stripe_cubit.dart';

class PaymentDependencyInjection {
  static void init() {
//////cubits
    sl.registerFactory(() => StripeCubit(sl()));

/////////usecases
    sl.registerLazySingleton(() => MakePaymentUseCase(sl()));

//////////repos
    sl.registerLazySingleton<BasePaymentRepo>(() => Paymentrepo(sl()));

    /////datasource
    sl.registerLazySingleton<PaymentRemoteDataSource>(
        () => PaymentRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton(() => StripeService(sl()));
  }
}
