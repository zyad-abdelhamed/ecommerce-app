import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget appMaterialButton(
    {required VoidCallback buttonFunction,
    required String buttonName,
    Color buttonColor = AppColors.primaryColor}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: MaterialButton(
      height: 50,
      onPressed: buttonFunction,
      color: buttonColor,
      child: Text(
        buttonName,
        style:
            TextStyles.textStyle18BoldWhite,
      ),
    ),
  );
}
