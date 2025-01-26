import 'amount.dart';
import 'item_list.dart';

class PaypalModel {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalModel({this.amount, this.description, this.itemList});

  factory PaypalModel.fromJson(Map<String, dynamic> json) => PaypalModel(
        amount: json['amount'] == null
            ? null
            : Amount.fromJson(Map<String, dynamic>.from(json['amount'])),
        description: json['description']?.toString(),
        itemList: json['item_list'] == null
            ? null
            : ItemList.fromJson(Map<String, dynamic>.from(json['item_list'])),
      );

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount?.toJson(),
        if (description != null) 'description': description,
        if (itemList != null) 'item_list': itemList?.toJson(),
      };
}
