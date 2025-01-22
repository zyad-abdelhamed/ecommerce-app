import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/controller/cubit/stripe_cubit.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/payment1_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentPage1 extends StatelessWidget {
  const PaymentPage1({super.key});
//////////////////////
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StripeCubit(sl()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              ViewConstants.checkOut,
              style: TextStyles.textStyle18black,
            ),
            centerTitle: true,
            leading: const Icon(FontAwesomeIcons.arrowLeft),
          ),
          body: const Payment1Body()),
    );
  }
}
