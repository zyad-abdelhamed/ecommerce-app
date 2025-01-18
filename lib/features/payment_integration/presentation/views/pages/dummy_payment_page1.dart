import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DummyPaymentPage1 extends StatelessWidget {
  const DummyPaymentPage1({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxs.sizedBoxH10,
            const Text(
              ViewConstants.shippingAddress,
              style: TextStyles.textStyle18black,
            ),
            SizedBoxs.sizedBoxH20,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: ViewConstants.appShadow,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Soliman Esam',
                          style: TextStyles.textStyle18black,
                        ),
                        Text(
                          'Change',
                          style: TextStyles.textStyleNewPrice,
                        )
                      ],
                    ),
                    SizedBoxs.sizedBoxH10,
                    Text('zewir,shebinelkom,menofia,egypt')
                  ],
                ),
              ),
            ),
            SizedBoxs.sizedBoxH30,
            const Text(
              ViewConstants.deliveryMethod,
              style: TextStyles.textStyle18black,
            ),
            SizedBoxs.sizedBoxH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customButtonPayment(
                    image: 'assets/paypal.png', function: () {}),
                customButtonPayment(
                    image: 'assets/stripe.png', function: () {}),
              ],
            ),
            SizedBoxs.sizedBoxH30,
            Column(
              spacing: 10,
              children: [
                customRowforPayment(text: 'Order:', price: '112\$'),
                customRowforPayment(text: 'Delivery:', price: '15\$'),
                customRowforPayment(text: 'Summary:', price: '127\$'),
                appMaterialButton(buttonFunction: () {
              
            }, buttonName: 'SUBMIT ORDER')
              ],
            ),
           
            
          ],
        ),
      ),
    );
  }
}

//////////////
Widget customButtonPayment(
    {required String image, required GestureTapCallback function}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: ViewConstants.appShadow,
      ),
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    ),
  );
}
///////////
Widget customRowforPayment({
  required String text,
  required String price
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(text,style: TextStyles.textStyle16grey,),
      Text(price,style: TextStyles.textStyle18black,)
    ],
  );
}