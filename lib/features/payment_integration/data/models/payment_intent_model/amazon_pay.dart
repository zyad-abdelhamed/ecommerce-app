class AmazonPay {
  dynamic expressCheckoutElementSessionId;

  AmazonPay({this.expressCheckoutElementSessionId});

  factory AmazonPay.fromJson(Map<String, dynamic> json) => AmazonPay(
        expressCheckoutElementSessionId:
            json['express_checkout_element_session_id'],
      );

  Map<String, dynamic> toJson() => {
        if (expressCheckoutElementSessionId != null)
          'express_checkout_element_session_id':
              expressCheckoutElementSessionId,
      };
}
