import 'package:ecommerce_application/features/payment_integration/presentation/controller/cubit/stripe_cubit.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/custom_container_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RowOfPaymentButtons extends StatelessWidget {
  const RowOfPaymentButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StripeCubit, StripeState>(
      builder: (context, state) {
        StripeCubit cubit = context.read<StripeCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                cubit.updateActiveButton();
              },
              child: buildCustomContainerPayment(
                  image: 'assets/paypal.png',
                  color: state.activeButton == 1 ? Colors.green : Colors.grey),
            ),
            GestureDetector(
              onTap: () {
                cubit.updateActiveButton();
              },
              child: buildCustomContainerPayment(
                  image: 'assets/stripe.png',
                  color: state.activeButton == 2 ? Colors.green : Colors.grey),
            )
          ],
        );
      },
    );
  }
}
