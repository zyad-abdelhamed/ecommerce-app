import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/constants/secret_keys.dart';
import 'package:ecommerce_application/core/helper_functions/get_init_route.dart';
import 'package:ecommerce_application/core/helper_functions/onGenerateRoute.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/auth_dependency_injection.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/payment_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/app_theme.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product_type_adapter.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthDependencyInjection.init();
  PaymentDependencyInjection.init();
  DashboardDebendencyInjection.init();
  GlobalDependencyInjection.init();
  await sl<BaseCache>().cacheintIalization();

  await sl<BaseLocalization>().getLanguage();
  ApiConstant.token =
      sl<BaseCache>().getStringFromCache(key: CacheConstants.tokenKey) ?? '';
  Hive.registerAdapter(ProductTypeAdapter());    

  Stripe.publishableKey = SecretKeys.stripePublishKey;

  //await sl.get<BaseAuthLocalDataSource>().getTokenFromCache;

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(sl()),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final SettingsCubit settingsCubit = context.read<SettingsCubit>();
          return MaterialApp(
            theme: appTheme,
            darkTheme:
                appTheme.copyWith(scaffoldBackgroundColor: Colors.amberAccent),
            themeMode: settingsCubit.themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: getInitRoute,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
