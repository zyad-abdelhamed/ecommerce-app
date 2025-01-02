import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget appMaterialButton(
    {required VoidCallback buttonFunction, required String buttonName}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: MaterialButton(
      height: 50,
      onPressed: buttonFunction,
      color: const Color.fromARGB(255, 222, 73, 43),
      child: Text(
        buttonName,
        style:
            TextStyles.textStyle34.copyWith(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}
