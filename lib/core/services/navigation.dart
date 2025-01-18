import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce_application/features/auth/presentation/view/pages/log_in_page.dart';
import 'package:ecommerce_application/features/auth/presentation/view/pages/sign_up_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/bottom_navigation_bar.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/product_details_page.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/pages/dummy_payment_page1.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return sl
                .get<BaseAuthLocalDataSource>()
                .haveToken(token: ApiConstant.token)
            ? const DashboardPage()
            : const LogInPage();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LogInPage();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardPage();
      },
    ),
    // GoRoute(
    //   path: '/ProductDetailsPage',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const ProductDetailsPage();
    //   },
    // ),
  ],
);
