import 'package:flutter/material.dart';

Widget appMaterialButton(
        {required VoidCallback buttonFunction, required String buttonName}) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        height: 50,
        color: const Color.fromARGB(255, 222, 73, 43),
        onPressed: buttonFunction,
        child: Text(buttonName.toUpperCase(),style: const TextStyle(color: Colors.white),),
      ),
    );
