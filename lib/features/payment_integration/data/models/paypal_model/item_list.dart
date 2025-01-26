import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (items != null) 'items': items?.map((e) => e.toJson()).toList(),
      };
}
