import 'package:flutter/material.dart';

class ViewConstants {
  static const String alreadyHaveANAccount = 'Already have an account?  ';
  static const String signUp = 'sign up';
  static const String login = 'LogIn';
  static const String signUpSuccessfully = 'sign up successfully';
  static const String logInSuccessfully = 'log in successfully';
  static const Duration itervalDuration = Duration(seconds: 2);
  static const Duration cartAndAutoPlayAnimationDuration = Duration(seconds: 1);
  static List<BoxShadow> appShadow = [
    BoxShadow(
        blurRadius: 2,
        offset: const Offset(0, 2),
        spreadRadius: 1,
        color: Colors.grey.withValues(alpha: 0.2))
  ];
  static const Duration favoritesAnimationDuration =
      Duration(milliseconds: 500);
}
