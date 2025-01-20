import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentPage1 extends StatelessWidget {
  const PaymentPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            ViewConstants.checkOut,
            style: TextStyles.textStyle18black,
          ),
          centerTitle: true,
          leading: const Icon(FontAwesomeIcons.arrowLeft),
        ),
        body: const PaymentPage1());
  }
}
