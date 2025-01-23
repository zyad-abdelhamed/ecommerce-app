import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
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
          fillColor: AppColors.whiteDesignColor,
          labelText: appTextFieldInputMdel.textFieldName,
          labelStyle: TextStyles.textStyle16grey,
          border: InputBorder.none,
        ),
      ),
    );

////////ده زر تقوم انت فيه يعم validator

Widget getAppTextfieldWithVaildator(
        {required FormFieldValidator<String> function,
        required String textFieldName,
        required BuildContext context,
        required TextEditingController controller,
        bool obscure = false}) =>
    DecoratedBox(
      decoration: BoxDecoration(boxShadow: ViewConstants.appShadow),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        validator: function,
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

//input model
class AppTextFieldInputMdel {
  final String textFieldName;
  final BuildContext context;
  final TextEditingController controller;
  final bool obscure;
  final ValueChanged<String>? onChangedFunction;
  final IconData? icon;
  final VoidCallback? iconFunction;

  AppTextFieldInputMdel(
      {required this.textFieldName,
      required this.context,
      required this.controller,
      this.onChangedFunction,
      this.icon,
      this.iconFunction,
      this.obscure = false});
}
