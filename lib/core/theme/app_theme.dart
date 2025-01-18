import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
    primaryColor: AppColors.primaryColor,
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, centerTitle: true),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.inActiveColor,
      showUnselectedLabels: true,
      enableFeedback: true,
    ));
