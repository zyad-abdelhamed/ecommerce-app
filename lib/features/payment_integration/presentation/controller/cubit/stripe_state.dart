part of 'stripe_cubit.dart';

 class StripeState extends Equatable {
  final RequestStateEnum? stripeRequestStateEnum;
  final String errorMessage;
  const StripeState(
      {this.errorMessage = '',
       this.stripeRequestStateEnum});

  @override
  List<Object?> get props => [errorMessage, stripeRequestStateEnum];
}
