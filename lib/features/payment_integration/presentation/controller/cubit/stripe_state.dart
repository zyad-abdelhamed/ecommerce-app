part of 'stripe_cubit.dart';

 class StripeState extends Equatable {
  final RequestStateEnum? stripeRequestStateEnum;
  final String errorMessage;
  final int activeButton;
  const StripeState(
      {this.activeButton = 1,
        this.errorMessage = '',
       this.stripeRequestStateEnum});

  @override
  List<Object?> get props => [errorMessage, stripeRequestStateEnum , activeButton];
}
