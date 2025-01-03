import 'package:flutter/material.dart';

 appSneakBar(
        {required BuildContext context, required String message,required bool isError}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor:isError?Colors.black :Colors.greenAccent  ,
     content: Center(child: Text(message,style: TextStyle(color:isError? Colors.red :Colors.white),)),
    ));
