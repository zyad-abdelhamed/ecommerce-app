import 'amazon_pay.dart';
import 'card.dart';
import 'cashapp.dart';
import 'klarna.dart';
import 'link.dart';

class PaymentMethodOptions {
  AmazonPay? amazonPay;
  Card? card;
  Cashapp? cashapp;
  Klarna? klarna;
  Link? link;

  PaymentMethodOptions({
    this.amazonPay,
    this.card,
    this.cashapp,
    this.klarna,
    this.link,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      amazonPay: json['amazon_pay'] == null
          ? null
          : AmazonPay.fromJson(Map<String, dynamic>.from(json['amazon_pay'])),
      card: json['card'] == null
          ? null
          : Card.fromJson(Map<String, dynamic>.from(json['card'])),
      cashapp: json['cashapp'] == null
          ? null
          : Cashapp.fromJson(Map<String, dynamic>.from(json['cashapp'])),
      klarna: json['klarna'] == null
          ? null
          : Klarna.fromJson(Map<String, dynamic>.from(json['klarna'])),
      link: json['link'] == null
          ? null
          : Link.fromJson(Map<String, dynamic>.from(json['link'])),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amazonPay != null) 'amazon_pay': amazonPay?.toJson(),
        if (card != null) 'card': card?.toJson(),
        if (cashapp != null) 'cashapp': cashapp?.toJson(),
        if (klarna != null) 'klarna': klarna?.toJson(),
        if (link != null) 'link': link?.toJson(),
      };
}
