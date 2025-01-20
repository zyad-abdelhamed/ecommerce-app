import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
            onPressed: () {
              OnboardingCubit.goToLoginPage(context: context);
            },
            child: const Text(
              'skip',
              style: TextStyles.textStyle18BoldWhite,
            )));
  }
}
