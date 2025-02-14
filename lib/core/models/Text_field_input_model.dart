import 'package:flutter/material.dart';

class AppTextFieldInputMdel {
  final String? textFieldLabel;
  final String? initialValue;
  final String? textFieldHint;
  final BuildContext context;
  final TextEditingController? controller;
  final bool obscure;
  final ValueChanged<String>? onChangedFunction;
  final IconData? icon;
  final VoidCallback? iconFunction;
  final bool readOnly;
  final FormFieldValidator<String>? validator;

  AppTextFieldInputMdel(
      { this.textFieldLabel,
      this.textFieldHint,
      this.initialValue,
      required this.context,
      this.controller,
      this.onChangedFunction,
      this.icon,
      this.validator,
      this.iconFunction,
      this.obscure = false,
      this.readOnly = false});
}
