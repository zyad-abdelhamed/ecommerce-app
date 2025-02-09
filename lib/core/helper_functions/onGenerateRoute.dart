import 'package:ecommerce_application/features/auth/presentation/view/pages/log_in_page.dart';
import 'package:ecommerce_application/features/auth/presentation/view/pages/sign_up_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/add_shipping_address_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/bottom_navigation_bar.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/profile_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/settings_page.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/shipping_addresses_page.dart';
import 'package:ecommerce_application/features/onboarding/presentation/view/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'OnBoarding':
      return MaterialPageRoute<OnboardingPage>(
        builder: (BuildContext context) => const OnboardingPage(),
      );
    case 'login':
      return MaterialPageRoute<LogInPage>(
        builder: (BuildContext context) => const LogInPage(),
      );
    case 'signUp':
      return MaterialPageRoute<SignUpPage>(
        builder: (BuildContext context) => const SignUpPage(),
      );
    case 'dashboard':
      return MaterialPageRoute<DashboardPage>(
        builder: (BuildContext context) => const DashboardPage(),
      );
    case 'AddShippingAddress':
      return MaterialPageRoute<DashboardPage>(
        builder: (BuildContext context) => const AddShippingAddressPage(),
      );
    case 'Settings':
      return MaterialPageRoute<SettingsPage>(
        builder: (BuildContext context) => const SettingsPage(),
      );
    case 'ShippingAddresses':
      return MaterialPageRoute<ShippingAddressesPage>(
        builder: (BuildContext context) => const ShippingAddressesPage(),
      );
      case 'profile':
      return MaterialPageRoute<ProfilePage>(
        builder: (BuildContext context) => const ProfilePage(),
      );
    // case 'PaymentPage1':
    // return MaterialPageRoute<PaymentPage1>(
    //   builder: (BuildContext context) => const PaymentPage1(),
    // );
    default:
      return MaterialPageRoute<Scaffold>(
        builder: (BuildContext context) => const Scaffold(),
      );
  }
}
