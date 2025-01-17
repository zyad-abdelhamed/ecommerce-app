import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:flutter/material.dart';

Widget getSecondAppTextfield(
        {required AppTextFieldInputMdel appTextFieldInputMdel}) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        onChanged: appTextFieldInputMdel.onChangedFunction,
        controller: appTextFieldInputMdel.controller,
        validator: (value) {
          if (appTextFieldInputMdel.controller.text.isEmpty) {
            return '${appTextFieldInputMdel.textFieldName} must not be empty';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          suffix: GestureDetector(
              onTap: appTextFieldInputMdel.suffixIconFunction,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  appTextFieldInputMdel.suffixIcon,
                  color: Colors.white,
                ),
              )),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
          filled: true,
          fillColor: Colors.white,
          hintText: appTextFieldInputMdel.textFieldName,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 209, 207, 207)),
          border: InputBorder.none,
        ),
      ),
    );
