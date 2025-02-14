import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget getAppTextfield(
        {required AppTextFieldInputMdel appTextFieldInputMdel}) =>
    DecoratedBox(
      decoration: BoxDecoration(boxShadow: ViewConstants.appShadow),
      child: TextFormField(
        readOnly: appTextFieldInputMdel.readOnly,
        obscureText: appTextFieldInputMdel.obscure,
        initialValue: appTextFieldInputMdel.initialValue,
        controller: appTextFieldInputMdel.controller,
        validator: appTextFieldInputMdel.validator,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          filled: true,
          fillColor: AppColors.whiteOrBlackDesignColor,
          labelText: appTextFieldInputMdel.textFieldLabel,
          labelStyle: TextStyles.textStyle16grey,
          hintText: appTextFieldInputMdel.textFieldHint,
          hintStyle: TextStyles.textStyle16grey,
          border: InputBorder.none,
        ),
      ),
    );
