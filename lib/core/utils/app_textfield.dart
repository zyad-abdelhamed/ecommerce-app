import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:flutter/material.dart';

Widget getAppTextfield(
        {required AppTextFieldInputMdel appTextFieldInputMdel}) =>
    DecoratedBox(
      decoration: BoxDecoration(boxShadow: ViewConstants.appShadow),
      child: TextFormField(
        obscureText: appTextFieldInputMdel.obscure,
        controller: appTextFieldInputMdel.controller,
        validator: (value) {
          if (appTextFieldInputMdel.controller.text.isEmpty) {
            return '${appTextFieldInputMdel.textFieldName} must not be empty';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          filled: true,
          fillColor: Colors.white,
          labelText: appTextFieldInputMdel.textFieldName,
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 209, 207, 207)),
          border: InputBorder.none,
        ),
      ),
    );
//input model
class AppTextFieldInputMdel {
  final String textFieldName;
  final BuildContext context;
  final TextEditingController controller;
  final bool obscure;

  AppTextFieldInputMdel(
      {required this.textFieldName,
      required this.context,
      required this.controller,
      this.obscure = false});
}
