import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/payment_intent_input_model.dart';

abstract class BasePaymentRepo {
  Future<Either<Failure, Unit>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel);
}
