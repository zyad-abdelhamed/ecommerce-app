import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/features/onboarding/presentation/controller/cubit/onboarding_cubit.dart';
import 'package:ecommerce_application/features/onboarding/presentation/view/components/next_button_widget.dart';
import 'package:ecommerce_application/features/onboarding/presentation/view/components/page_indicator.dart';
import 'package:ecommerce_application/features/onboarding/presentation/view/components/page_view_widget.dart';
import 'package:ecommerce_application/features/onboarding/presentation/view/components/skip_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Stack(
        children: <Widget>[
          Container(color: AppColors.primaryColor),
          const Column(
            children: [
              Expanded(
                flex: 1,
                child: SkipButtonWidget(),
              ),
              Expanded(
                flex: 3,
                child: PageViewWidget(),
              ),
            ],
          ),
          const Positioned(
              bottom: -39.5, right: -39.5, child: NextButtonWidget()),
          const Positioned(bottom: 60.0, left: 60.0, child: PageIndicator())
        ],
      ),
    );
  }
}
