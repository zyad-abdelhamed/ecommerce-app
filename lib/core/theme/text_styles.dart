import 'package:ecommerce_application/core/helper_functions/get_responsive_font_size.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle textStyle34({required BuildContext context}) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context: context, fontSize: 34),
        fontWeight: FontWeight.bold);
  }

  static const TextStyle textStyle20Boldgreen = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.greenDesignColor);
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
  static TextStyle textStyle16primarycolorwithopacity =
      TextStyle(fontSize: 16, color: AppColors.inActivePrimaryColor);
  static TextStyle textStyle20Bold =
      GoogleFonts.abhayaLibre(fontSize: 20, fontWeight: FontWeight.bold);
}
