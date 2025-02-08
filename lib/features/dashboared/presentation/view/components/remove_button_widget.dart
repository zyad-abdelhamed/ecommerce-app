import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:flutter/material.dart';

class RemoveButtonWidget extends StatelessWidget {
  final VoidCallback removeButtonFunction;
  const RemoveButtonWidget({
    super.key,
    required this.removeButtonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: removeButtonFunction,
        child: Text(
          "remove".localization,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
