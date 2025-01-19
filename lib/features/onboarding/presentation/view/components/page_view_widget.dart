import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:ecommerce_application/features/onboarding/presentation/view/components/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final OnboardingCubit controller = context.read<OnboardingCubit>();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            color: AppColors.scaffoldBackgroundColor,
          ),
          child: PageView(
            controller:controller.pageController,
            children: [
              PageViewItem(pageViewItemModel: pageViewItemList[0]),
              PageViewItem(pageViewItemModel: pageViewItemList[1]),
              PageViewItem(pageViewItemModel: pageViewItemList[2]),
            ],
          ),
        );
      },
    );
  }
}
