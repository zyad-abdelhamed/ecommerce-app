import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
TextTheme textTheme = ThemeData.dark().textTheme;
ThemeData appTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    textTheme: GoogleFonts.montserratTextTheme(textTheme),
    appBarTheme:  AppBarTheme(
        backgroundColor: AppColors.whiteOrBlackDesignColor, centerTitle: true),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyDesignColor,
      backgroundColor: AppColors.whiteOrBlackDesignColor,
      showUnselectedLabels: true,
      enableFeedback: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: CircleBorder(),
      iconSize: 30,
    ),);
