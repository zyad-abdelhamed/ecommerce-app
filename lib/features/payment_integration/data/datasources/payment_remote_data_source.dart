import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/services/stripe_service.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/payment_intent_input_model.dart';

abstract class PaymentRemoteDataSource {
  Future<Unit> makePayment(PaymentIntentInputModel paymentIntentInputModel);
}

class PaymentRemoteDataSourceImpl extends PaymentRemoteDataSource {
  final StripeService stripeService;
  PaymentRemoteDataSourceImpl(this.stripeService);
  @override
  Future<Unit> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    return unit;
  }
}
