class AutomaticPaymentMethods {
  String? allowRedirects;
  bool? enabled;

  AutomaticPaymentMethods({this.allowRedirects, this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(
      allowRedirects: json['allow_redirects']?.toString(),
      enabled: json['enabled']?.toString().contains("true"),
    );
  }

  Map<String, dynamic> toJson() => {
        if (allowRedirects != null) 'allow_redirects': allowRedirects,
        if (enabled != null) 'enabled': enabled,
      };
}
