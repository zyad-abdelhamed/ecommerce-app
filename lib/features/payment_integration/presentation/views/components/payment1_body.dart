import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/core/widgets/app_sneak_bar.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/address.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/paypal_model/amount.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/paypal_model/item.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/paypal_model/item_list.dart';
import 'package:ecommerce_application/features/payment_integration/data/models/paypal_model/paypal_model.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/controller/cubit/stripe_cubit.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/container_of_address.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/custom_row_for_payment.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/components/row_of_payment_buttons.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/pages/thank_you_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../data/models/paypal_model/details.dart';

class Payment1Body extends StatelessWidget {
  const Payment1Body({super.key, required this.totalPrice, required this.addressEntity});
  final String totalPrice;
  final AddressEntity addressEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "shipping_address".localization,
            style: TextStyles.textStyle18black,
          ),
          containerOfAddress(
            name: addressEntity.name,
            address: addressEntity.details,
            function: () {},
          ),
           Text(
            "delivery_method".localization,
            style: TextStyles.textStyle18black,
          ),
          const RowOfPaymentButtons(),
          SizedBoxs.sizedBoxH30,
          Column(
            spacing: 10,
            children: [
              customRowforPayment(text: "Order:".localization, price: '$totalPrice\$'),
              customRowforPayment(text: "Delivery:".localization, price: '0\$'),
              customRowforPayment(text: "Summary:".localization, price: '$totalPrice\$'),
              BlocConsumer<StripeCubit, StripeState>(
                listener: (context, state) {
                  if (state.stripeRequestStateEnum == RequestStateEnum.failed) {
                    appSneakBar(
                        context: context,
                        message: state.errorMessage,
                        isError: true);
                  } else if (state.stripeRequestStateEnum ==
                      RequestStateEnum.success) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ThankYouPage(),
                    ));
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
                        if (state.activeButton == 2) {
                          cubit.makePayment(
                              paymentIntentInputModel: PaymentIntentInputModel(
                                  amount: totalPrice, currency: 'USD'));
                        } else {
                          var paypalModel = PaypalModel(
                              amount: Amount(
                                  currency: 'USD',
                                  details: Details(
                                      shipping: '0',
                                      shippingDiscount: 0,
                                      subtotal: '90'),
                                  total: '90'),
                              description:
                                  'The payment transaction description.',
                              itemList: ItemList(items: [
                                Item(
                                    currency: 'USD',
                                    name: 'soliman',
                                    price: '30',
                                    quantity: 3)
                              ]));
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PaypalCheckoutView(
                              sandboxMode: true,
                              clientId:
                                  "AakWTi_MtaqAwF1aL5dX60GORfm1Rro-maHj_uv0EjYvcJbIkRP5Q6ZoRX5jOTreId-xFs0POW4Ikacr",
                              secretKey:
                                  "EHg3u4JRpDWvPPQRV7zZbv64_ru1bmjzQmG9xzzh789ydhO-bEvQDya5fGmrqjLVcskPQKOulnFLwTQA",
                              transactions: [paypalModel.toJson()],
                              note:
                                  "Contact us for any questions on your order.",
                              onSuccess: (Map params) async {
                                print("onSuccess: $params");
                              },
                              onError: (error) {
                                print("onError: $error");
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                print('cancelled:');
                              },
                            ),
                          ));
                        }
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
