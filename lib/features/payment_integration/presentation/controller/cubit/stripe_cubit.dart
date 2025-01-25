import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:ecommerce_application/features/payment_integration/domain/usecases/make_payment_use_case.dart';
import 'package:equatable/equatable.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  final MakePaymentUseCase makePaymentUseCase;
  StripeCubit(this.makePaymentUseCase) : super(const StripeState());

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(const StripeState(stripeRequestStateEnum: RequestStateEnum.loading));
    var result = await makePaymentUseCase(parameters: paymentIntentInputModel);
    result.fold(
        (l) => emit(StripeState(
            errorMessage: l.message,
            stripeRequestStateEnum: RequestStateEnum.failed)),
        (r) => emit(const StripeState(
            stripeRequestStateEnum: RequestStateEnum.success)));
  }

  void updateActiveButton() {
    if (state.activeButton == 1) {
      emit(const StripeState(activeButton: 2));
    } else {
      emit(const StripeState(activeButton: 1));
    }
  }
}
