import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/models/api_service_input_model.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService;
  StripeService(this.apiService);

  Future<PaymentIntentModel> paymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    Map<String, dynamic> response = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            body: paymentIntentInputModel.tojson(),
            url: ApiConstant.paymentIntentEndPoint,
            apiHeaders: ApiHeadersEnum.paymentHeaders,
            apiContentType: ApiContentTypeEnum.applicationXWwwFormUrlencoded));
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: 'solimanandziad'));
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel paymentIntentModel =
        await paymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
