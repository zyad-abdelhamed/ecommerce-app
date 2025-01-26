import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.white, centerTitle: true),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyDesignColor,
      backgroundColor: AppColors.whiteDesignColor,
      showUnselectedLabels: true,
      enableFeedback: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.blackDesignColor,
      shape: CircleBorder(),
      iconSize: 30,
    ));
