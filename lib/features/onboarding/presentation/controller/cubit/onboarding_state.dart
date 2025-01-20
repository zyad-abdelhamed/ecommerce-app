part of 'onboarding_cubit.dart';

 class OnboardingState extends Equatable {
  final AnimateToPageStateEnum? animateToPageStateEnum;
  const OnboardingState({this.animateToPageStateEnum});

  @override
  List<Object?> get props => [animateToPageStateEnum];
}

