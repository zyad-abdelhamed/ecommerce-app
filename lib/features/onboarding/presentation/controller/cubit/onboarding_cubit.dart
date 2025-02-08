import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());
  final PageController pageController = PageController();
  void animateToNextPage({required BuildContext context}) {
    if (pageController.page!.round() == 2) {
      goToLoginPage(context: context);
      sl<BaseCache>()
          .insertBoolToCache(key: CacheConstants.onBoardingKey, value: false);
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 1), curve: Easing.legacy);
    emit(const OnboardingState(
        animateToPageStateEnum: AnimateToPageStateEnum.animateToNextPageDone));
  }

  static void goToLoginPage({required BuildContext context}) {
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
  }

  @override
  Future<void> close() {
    pageController.dispose();

    return super.close();
  }
}
