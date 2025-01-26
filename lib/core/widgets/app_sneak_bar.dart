import 'package:ecommerce_application/core/helper_functions/get_responsive_font_size.dart';
import 'package:flutter/material.dart';

appSneakBar(
        {required BuildContext context,
        required String message,
        required bool isError}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isError ? Colors.black : Colors.greenAccent,
      content: Center(
          child: Text(
        message,
        style: TextStyle(
            color: isError ? Colors.red : Colors.white,
            fontSize: getResponsiveFontSize(
              context: context,
              fontSize: 20,
            ),
            fontWeight: FontWeight.bold),
      )),
    ));
