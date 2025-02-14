import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xFFDB3022);
  static  Color whiteOrBlackDesignColor = Color(0xFFffffff);
  static const Color blackDesignColor = Color(0xFF222222);
  static const Color inActiveBlackColor = Color.fromARGB(255, 44, 43, 43);
  static const Color yellowDesignColor = Color(0xFFFFBA49);
  static const Color greyDesignColor = Color(0xFF9B9B9B);
  static const Color greenDesignColor = Color(0xFF2AA952);
  static Color inActiveGreenDesignColor =
      const Color(0xFF2AA952).withValues(alpha: .5);
  static Color inActivePrimaryColor = primaryColor.withValues(alpha: .5);
  static Color scaffoldBackgroundColor = Color(0xffF9F9F9);
  static const Color inActiveColor = Color.fromARGB(255, 211, 207, 207);
}

