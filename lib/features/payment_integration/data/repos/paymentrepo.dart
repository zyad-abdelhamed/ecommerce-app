import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/features/payment_integration/data/datasources/payment_remote_data_source.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:ecommerce_application/features/payment_integration/domain/repos/base_payment_repo.dart';

class Paymentrepo extends BasePaymentRepo {
  PaymentRemoteDataSource paymentRemoteDataSource;
  Paymentrepo(this.paymentRemoteDataSource);
  @override
  Future<Either<Failure, Unit>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      await paymentRemoteDataSource.makePayment(paymentIntentInputModel);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
