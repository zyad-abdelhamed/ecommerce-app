class Klarna {
  dynamic preferredLocale;

  Klarna({this.preferredLocale});

  factory Klarna.fromJson(Map<String, dynamic> json) => Klarna(
        preferredLocale: json['preferred_locale'],
      );

  Map<String, dynamic> toJson() => {
        if (preferredLocale != null) 'preferred_locale': preferredLocale,
      };
}
