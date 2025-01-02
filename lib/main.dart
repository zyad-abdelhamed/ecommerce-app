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
import 'package:ecommerce_application/core/constants/variable_constant.dart';
import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/core/services/navigation.dart';
import 'package:ecommerce_application/core/theme/app_theme.dart';
import 'package:ecommerce_application/core/services/shared.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthDependencyInjection.init();
  await Cache.cacheintialization();
  VariableConstant.token = Cache.getcache(key: 'token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(sl(), sl())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: appTheme,
      ),
    );
  }
}
