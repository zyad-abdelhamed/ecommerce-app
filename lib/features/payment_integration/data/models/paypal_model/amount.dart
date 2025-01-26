import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        total: json['total']?.toString(),
        currency: json['currency']?.toString(),
        details: json['details'] == null
            ? null
            : Details.fromJson(Map<String, dynamic>.from(json['details'])),
      );

  Map<String, dynamic> toJson() => {
        if (total != null) 'total': total,
        if (currency != null) 'currency': currency,
        if (details != null) 'details': details?.toJson(),
      };
}
