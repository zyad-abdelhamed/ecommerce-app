import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/core/widgets/app_sneak_bar.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/controller/cubit/stripe_cubit.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/container_of_address.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/custom_row_for_payment.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/row_of_payment_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              BlocConsumer<StripeCubit, StripeState>(
                listener: (context, state) {
                  if (state.stripeRequestStateEnum == RequestStateEnum.failed) {
                    appSneakBar(
                        context: context,
                        message: state.errorMessage,
                        isError: true);
                  } else if (state.stripeRequestStateEnum ==
                      RequestStateEnum.success) {
                    appSneakBar(
                        context: context,
                        message: 'Payment Submitted Successfully',
                        isError: false);
                  }
                },
                builder: (context, state) {
                  StripeCubit cubit = context.read<StripeCubit>();
                  return appMaterialButton(
                      buttonFunction: () {
                        cubit.makePayment(
                            paymentIntentInputModel: PaymentIntentInputModel(
                                amount: '127', currency: 'USD'));
                      },
                      buttonName: state.stripeRequestStateEnum ==
                              RequestStateEnum.loading
                          ? 'LOADING....'
                          : 'SUBMIT ORDER');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
