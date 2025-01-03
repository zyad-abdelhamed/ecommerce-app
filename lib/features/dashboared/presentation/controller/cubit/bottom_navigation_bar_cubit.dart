import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottmNavigationBarInitial());
  final List<String> titles = const ['Home', 'Categories', 'Favourite','Cart','Profile'];
   int selectedTapIndex = 0;
  final PageController pageController = PageController();
  

  void onChangeTabIndex(int index) {
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex);

    emit(DashBoardChangeItemState());
  }

}
