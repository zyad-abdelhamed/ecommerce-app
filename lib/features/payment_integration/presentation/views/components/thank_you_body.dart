import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/text_styles.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    // حساب عرض الشاشة لجعل الأيقونة responsive
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            Icon(
              FontAwesomeIcons.check,
              size: screenWidth * 0.3,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              'Success!',
              style: TextStyles.textStyle34(context: context),
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                Text(
                  'Your order will be delivered soon.',
                  style: TextStyles.textStyle18black,
                ),
                Text(
                  'Thank you for choosing our app!',
                  style: TextStyles.textStyle18black,
                ),
              ],
            ),
            const Spacer(),
            appMaterialButton(
              buttonFunction: () {
                context.push('/dashboard');
              },
              buttonName: 'CONTINUE SHOPPING',
            ),
          ],
        ),
      ),
    );
  }
}
