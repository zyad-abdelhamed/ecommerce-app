import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/container_of_address.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/custom_row_for_payment.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/row_of_payment_buttons.dart';
import 'package:flutter/material.dart';

class Payment1Body extends StatelessWidget {
  const Payment1Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            ViewConstants.shippingAddress,
            style: TextStyles.textStyle18black,
          ),
          containerOfAddress(
            name: 'Soliman Esam',
            address: 'zewir ,shebinelkom , menofia , egypt',
            function: () {},
          ),
          const Text(
            ViewConstants.deliveryMethod,
            style: TextStyles.textStyle18black,
          ),
          const RowOfPaymentButtons(),
          SizedBoxs.sizedBoxH30,
          Column(
            spacing: 10,
            children: [
              customRowforPayment(text: 'Order:', price: '112\$'),
              customRowforPayment(text: 'Delivery:', price: '15\$'),
              customRowforPayment(text: 'Summary:', price: '127\$'),
              appMaterialButton(
                  buttonFunction: () {}, buttonName: 'SUBMIT ORDER')
            ],
          ),
        ],
      ),
    );
  }
}
