import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        final BottomNavigationBarCubit controller = context.read<BottomNavigationBarCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
            title: Text(
             controller.titles[controller.selectedTapIndex],
            ),
          ),
          body: PageView(
            controller: controller.pageController,
            onPageChanged: controller.onChangeTabIndex,
            children: [Center(child: Text(controller.titles[controller.selectedTapIndex],))],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.lightBlue,
            currentIndex: controller.selectedTapIndex,
            onTap: controller.onChangeTabIndex,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
