import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:flutter/material.dart';

Widget getAppTextfield(
        {required String textFieldName,
        required BuildContext context,
        required TextEditingController controller,
        bool obscure = false}) =>
    DecoratedBox(
      decoration: BoxDecoration(boxShadow: ViewConstants.appShadow),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        validator: (value) {
          if (controller.text.isEmpty) {
            return '$textFieldName must not be empty';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          filled: true,
          fillColor: Colors.white,
          labelText: textFieldName,
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 209, 207, 207)),
          border: InputBorder.none,
        ),
      ),
    );
