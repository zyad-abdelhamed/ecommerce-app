import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/cart_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/categries_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/favorites_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/home_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/profile_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomNavigationBarCubit(),
        child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
            builder: (context, state) {
          final BottomNavigationBarCubit controller =
              context.read<BottomNavigationBarCubit>();
          return Directionality(
            textDirection: sl<BaseLocalization>().getDirectionality(),
            child: Scaffold(
              body: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.onPageChanged(index);
                },
                children: const <Widget>[
                  HomePage(),
                  CategoryPage(),
                  FavoritesPage(),
                  CartsPage(),
                  SearchPage(),
                  ProfilePage()
                ],
              ),
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                child: BottomNavigationBar(
                  iconSize: 40.0,
                  currentIndex: controller.selectedTapIndex,
                  onTap: (index) {
                    controller.onChangeTabIndex(index);
                  },
            
                  type: BottomNavigationBarType.fixed,
                  items: controller.bottomNavigationBarItems,
                ),
              ),
            ),
          );
        }));
  }
}
