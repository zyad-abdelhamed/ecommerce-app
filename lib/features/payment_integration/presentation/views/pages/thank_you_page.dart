import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/extentions/responsive_extention.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/text_styles.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Icon(
          FontAwesomeIcons.check,
          size: context.width * 0.3,
          color: Colors.green,
        ),
        SizedBoxs.sizedBoxH20,
        Text(
          "Success!".localization,
          style: TextStyles.textStyle34(context: context),
        ),
        SizedBoxs.sizedBoxH10,
         Text(
          "Thank_you_page_text".localization,
          style: TextStyles.textStyle18black,
        ),
        const Spacer(),
        appMaterialButton(
          buttonFunction: () {
            Navigator.pushNamedAndRemoveUntil(
                context, 'dashboard', (route) => false);
          },
          buttonName: "CONTINUE_SHOPPING".localization,
        ),
      ],
    ),
    );
  }
}
