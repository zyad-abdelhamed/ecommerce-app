import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static const TextStyle textStyle34 =
      TextStyle(fontSize: 34, fontWeight: FontWeight.bold);
  static const TextStyle textStyle20Boldgreen =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green);
  static const TextStyle textStyle18BoldWhite =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18);
  static const TextStyle textStyle18grey =
      TextStyle(fontSize: 18, color: Color.fromARGB(255, 179, 176, 176));

  static const TextStyle textStyle18black =
      TextStyle(fontSize: 18, color: Colors.black);

  static const TextStyle textStyleOldPrice = TextStyle(
      fontSize: 15,
      color: Colors.blueGrey,
      decoration: TextDecoration.lineThrough);
  static const TextStyle textStyleNewPrice = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Color.fromARGB(255, 222, 73, 43),
  );
  static TextStyle textStyle16grey =
      TextStyle(fontSize: 16, color: Colors.grey[600]);

  static TextStyle textStyle20Bold =
      GoogleFonts.abhayaLibre(fontSize: 20, fontWeight: FontWeight.bold);
}
