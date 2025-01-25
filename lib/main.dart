// void main() async{
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await cache.cacheintialization();

// //  token =  cache.getcache(key: 'token');
// //  language= cache.getcache(key: 'lang');
//   // MaterialApp MyApp = MaterialApp(
//   //   debugShowCheckedModeBanner: false,
//   //   // theme: getlighttheme,
//   //   // darkTheme:getdarktheme ,
//   //   // themeMode: ThemeMode.system,
//   //   home:token != null && token!="" ? const BottomNav() :login_page() ,
//   // );
//   // runApp(MyApp);
// }
import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/constants/cache_constants.dart';
// import 'package:ecommerce_application/core/constants/secret_keys.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/auth_dependency_injection.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/services/navigation.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/payment_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/app_theme.dart';
import 'package:ecommerce_application/core/services/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // Stripe.publishableKey = SecretKeys.stripePublishKey;
  AuthDependencyInjection.init();
  PaymentDependencyInjection.init();
  DashboardDebendencyInjection.init();
  GlobalDependencyInjection.init();
  await Cache.cacheintialization();
  //await sl.get<BaseAuthLocalDataSource>().getTokenFromCache;
  ApiConstant.token = Cache.getcache(key: CacheConstants.tokenKey) ?? '';
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: appTheme,
    );
  }
}
