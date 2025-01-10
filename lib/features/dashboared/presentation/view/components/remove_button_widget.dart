import 'package:flutter/material.dart';

class RemoveButtonWidget extends StatelessWidget {
  const RemoveButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        child: const Text(
          'remove',
          style: TextStyle(color: Colors.black),
        ));
  }
}
