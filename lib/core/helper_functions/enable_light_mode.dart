import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void enableLightMode(){
  AppColors.whiteOrBlackDesignColor = const Color(0xFFffffff);
  AppColors.scaffoldBackgroundColor = const Color(0xffF9F9F9);
  textTheme = ThemeData.light().textTheme;
}