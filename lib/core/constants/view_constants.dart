import 'package:flutter/material.dart';

class ViewConstants {
  static const String alreadyHaveANAccount = 'Already have an account?  ';
  static const String signUp = 'sign up';
  static const String login = 'LogIn';
  static const String personalInfo = 'Personal Information';
  static const String password = 'Password';
  static const String change = 'Change';
  static const String checkOut = 'Checkout';
  static const String settings = 'Settings';
  static const String shippingAddress = 'Shipping address';
  static const String deliveryMethod = 'Delivery method';

  static const String signUpSuccessfully = 'sign up successfully';
  static const String logInSuccessfully = 'log in successfully';
  static const Duration itervalDuration = Duration(seconds: 2);
  static const Duration cartAndAutoPlayAnimationDuration = Duration(seconds: 1);
  static List<BoxShadow> appShadow = [
    BoxShadow(
        blurRadius: 2,
        offset: const Offset(0, 2),
        spreadRadius: 1,
        color: Colors.grey.withOpacity(0.2))
  ];
  static const Duration favoritesAnimationDuration =
      Duration(milliseconds: 500);
  static ispayPalActive(bool isActive) {
    if (isActive == true) {
      isActive = false;
    }
  }
}
