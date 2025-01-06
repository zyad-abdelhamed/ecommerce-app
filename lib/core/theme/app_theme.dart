import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    primaryColor: const Color.fromARGB(255, 222, 73, 43),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent.withOpacity(0.0),
        centerTitle: true),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color.fromARGB(255, 222, 73, 43),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      enableFeedback: true,
    ));
