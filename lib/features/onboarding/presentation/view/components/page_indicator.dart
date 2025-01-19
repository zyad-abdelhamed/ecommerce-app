import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingCubit controller = context.read<OnboardingCubit>();

    return SmoothPageIndicator(
      controller: controller.pageController,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: SlideEffect(
          dotColor: AppColors.inActivePrimaryColor,
          activeDotColor: AppColors.primaryColor),
    );
  }
}
