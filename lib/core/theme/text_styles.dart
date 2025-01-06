import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle textStyle34 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold
  );

  static const TextStyle textStyle25g = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 179, 176, 176));

    static const TextStyle textStyle25b = TextStyle(
    fontSize: 18,
    color: Colors.black);

    static const TextStyle textStyleOldPrice = TextStyle(
    fontSize: 18,
    color: Colors.blueGrey,
    decoration: TextDecoration.lineThrough);
    static const TextStyle textStyleNewPrice = TextStyle(
    fontSize: 18,
    color:  Color.fromARGB(255, 222, 73, 43),
   );
    
}