import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromARGB(255, 245, 240, 240),
    primaryColor: const Color.fromARGB(255, 222, 73, 43),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true),
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      selectedItemColor:  AppColors.primaryColor,
      unselectedItemColor: AppColors.inActiveColor,
      showUnselectedLabels: true,
      enableFeedback: true,
    )
    );
