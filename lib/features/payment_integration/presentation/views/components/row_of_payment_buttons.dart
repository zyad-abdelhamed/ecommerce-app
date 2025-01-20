import 'package:ecommerce_application/features/payment_integration/presentation/views/components/custom_container_payment.dart';
import 'package:flutter/material.dart';

class RowOfPaymentButtons extends StatefulWidget {
  const RowOfPaymentButtons({super.key});

  @override
  State<RowOfPaymentButtons> createState() => _RowOfPaymentButtonsState();
}

class _RowOfPaymentButtonsState extends State<RowOfPaymentButtons> {
  int isActive = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isActive = 1;
            });
          },
          child: buildCustomContainerPayment(
              image: 'assets/paypal.png',
              color: isActive == 1 ? Colors.green : Colors.grey),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isActive = 2;
            });
          },
          child: buildCustomContainerPayment(
              image: 'assets/stripe.png',
              color: isActive == 2 ? Colors.green : Colors.grey),
        )
      ],
    );
  }
}
