import 'package:flutter/material.dart';

 appSneakBar(
        {required BuildContext context, required String message}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
     content: Text(message),
    ));
