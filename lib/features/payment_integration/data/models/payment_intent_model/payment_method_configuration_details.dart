class PaymentMethodConfigurationDetails {
  String? id;
  dynamic parent;

  PaymentMethodConfigurationDetails({this.id, this.parent});

  factory PaymentMethodConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return PaymentMethodConfigurationDetails(
      id: json['id']?.toString(),
      parent: json['parent'],
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (parent != null) 'parent': parent,
      };
}
