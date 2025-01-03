import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottmNavigationBarInitial());
  final List<String> titles = const ['Home', 'Categories', 'Favourite','Cart','Profile'];
  final List<BottomNavigationBarItem> bottomNavigationBarItems = const [ BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Profile'),];
   int selectedTapIndex = 0;
  final PageController pageController = PageController();
  

  void onChangeTabIndex(int index) {
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex);

    emit(DashBoardChangeItemState());
  }

}
