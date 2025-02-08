import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottmNavigationBarInitial());

  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.home), label: "home".localization),
    BottomNavigationBarItem(
        icon: const Icon(FontAwesomeIcons.list),
        label: "categories".localization),
    BottomNavigationBarItem(
        icon: const Icon(FontAwesomeIcons.heart),
        label: "Favourite".localization),
    BottomNavigationBarItem(
        icon: const Icon(FontAwesomeIcons.cartShopping),
        label: "Cart".localization),
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.search), label: "search".localization),
    BottomNavigationBarItem(
        icon: const Icon(FontAwesomeIcons.user), label: "Profile".localization),
  ];
  int selectedTapIndex = 0;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    selectedTapIndex = index; // تحديث المؤشر عند تغيير الصفحة
    emit(DashBoardChangeItemState()); // تحديث الحالة
  }

  void onChangeTabIndex(int index) {
    if (index != selectedTapIndex) {
      selectedTapIndex = index;
      pageController
          .jumpToPage(selectedTapIndex); // الانتقال إلى الصفحة المطلوبة
      emit(DashBoardChangeItemState()); // تحديث الحالة
    }
  }
}
