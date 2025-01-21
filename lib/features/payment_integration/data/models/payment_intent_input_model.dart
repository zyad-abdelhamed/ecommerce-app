class PaymentIntentInputModel {
  final String amount;
  final String currency;

  PaymentIntentInputModel({required this.amount, required this.currency});

  Map<String, dynamic> tojson() {
    return {'amount': amount, 'currency': currency};
  }
}
