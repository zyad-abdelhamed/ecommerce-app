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
import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/services/navigation.dart';
import 'package:ecommerce_application/core/theme/app_theme.dart';
import 'package:ecommerce_application/core/services/shared.dart';
import 'package:ecommerce_application/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce_application/features/auth/domain/entities/auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthDependencyInjection.init();
  DashboardDebendencyInjection.init();
  await Cache.cacheintialization();
  sl
      .get<BaseAuthLocalDataSource>()
      .getTokenFromCache(token: sl.get<Auth>().token ?? '');
  runApp(const MyApp());
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
