import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:flutter/material.dart';

Widget getSecondAppTextfield(
        {required AppTextFieldInputMdel appTextFieldInputMdel}) =>
    Stack(
      children: [
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
              filled: true,
              fillColor: Colors.white,
              hintText: appTextFieldInputMdel.textFieldName,
              hintStyle: const TextStyle(color: Color.fromARGB(255, 209, 207, 207)),
              border: InputBorder.none,
            ),
          ),
        ),

        //icon button
        Positioned(
          right: 0.0,
          child: GestureDetector(
                  onTap: appTextFieldInputMdel.iconFunction,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      appTextFieldInputMdel.icon,
                      color: Colors.white,
                    ),
                  )))
      ],
    );
