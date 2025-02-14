import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void enableDarkMode(){
  AppColors.whiteOrBlackDesignColor = const Color(0xFF222222);
  AppColors.scaffoldBackgroundColor = const Color(0xFF222222);
  textTheme = ThemeData.dark().textTheme;
}