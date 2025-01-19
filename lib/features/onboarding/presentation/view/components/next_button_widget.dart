import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final OnboardingCubit controller = context.read<OnboardingCubit>();

    return GestureDetector(
      onTap: () => controller.animateToNextPage(context: context),
      child: const CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 79.5,
        child: Icon(
          Icons.skip_next,
          size: 50,
          color: AppColors.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
