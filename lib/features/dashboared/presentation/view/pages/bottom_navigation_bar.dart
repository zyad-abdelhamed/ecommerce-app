import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/utils/app_bottom_navigation_bar.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/categries_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/home_page.dart';
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
              print(ApiConstant.token);
          final BottomNavigationBarCubit controller =
              context.read<BottomNavigationBarCubit>();
          print('Current selectedTapIndex: ${controller.selectedTapIndex}');
          return Scaffold(
            body: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                print('PageView moved to index: $index');
                controller.onPageChanged(index);
              },
              children: const [
                HomePage(),
                CategoryPage(),
                Text('1'),
                Text('1'),
                Center(child: Text('1')),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    child: BottomNavigationBar(
                      iconSize: 40.0,
                      currentIndex: controller.selectedTapIndex,
                      onTap: (index) {
                        print('BottomNavigationBar tapped on index: $index');
                        controller.onChangeTabIndex(index);
                      },
                      items: controller.bottomNavigationBarItems,
                    ),
                  ),
                  appBottomNavigationBar(context)
                ],
              ),
            ),
          );
        }));
  }
}
