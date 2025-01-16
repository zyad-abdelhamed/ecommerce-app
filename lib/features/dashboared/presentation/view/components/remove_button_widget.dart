import 'package:flutter/material.dart';

class RemoveButtonWidget extends StatelessWidget {
  final VoidCallback removeButtonFunction;
  const RemoveButtonWidget({
    super.key, required this.removeButtonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: removeButtonFunction,
        child: const Text(
          'remove',
          style: TextStyle(color: Colors.black),
        ));
  }
}
