import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottmNavigationBarInitial());
  final List<String> titles = const [
    'Home',
    'Categories',
    'Favourite',
    'Cart',
    'Profile'
  ];
  final List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.list), label: 'Categories'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.heart), label: 'Favourite'),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cartShopping), label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.user), label: 'Profile'),
  ];
  int selectedTapIndex = 0;
  final PageController pageController = PageController();

void onPageChanged(int index) {
  print('onPageChanged called with index: $index');
  selectedTapIndex = index; // تحديث المؤشر عند تغيير الصفحة
  emit(DashBoardChangeItemState()); // تحديث الحالة
}
  void onChangeTabIndex(int index) {
  print('onChangeTabIndex called with index: $index');
  if (index != selectedTapIndex) {
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex); // الانتقال إلى الصفحة المطلوبة
    print('Updated selectedTapIndex to: $selectedTapIndex');
    emit(DashBoardChangeItemState()); // تحديث الحالة
  }
}
}
