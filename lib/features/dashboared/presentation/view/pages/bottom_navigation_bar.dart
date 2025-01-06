import 'package:ecommerce_application/core/utils/app_bottom_navigation_bar.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) => BottomNavigationBarCubit(),
      child: 
    BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        final BottomNavigationBarCubit controller =
            context.read<BottomNavigationBarCubit>();
        return   Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     controller.titles[controller.selectedTapIndex],
          //   ),
          // ),
          body: PageView(
            controller: controller.pageController,
            onPageChanged:(index) =>  controller.onChangeTabIndex(index),
            children: const [
              HomePage(),
            ],
          ),
          bottomNavigationBar: SizedBox(height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: BottomNavigationBar(iconSize: 40.0,
                    currentIndex: controller.selectedTapIndex,
                    onTap: (index) => controller.onChangeTabIndex(index),
                    items: controller.bottomNavigationBarItems,
                  ),
                ),
                Card(color: Colors.white,
                  child: appBottomNavigationBar(context))
              ],
            ),
          ),
      ) ;
      })
    );}}
  

