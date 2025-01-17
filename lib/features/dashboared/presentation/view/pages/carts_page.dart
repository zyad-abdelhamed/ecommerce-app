import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:ecommerce_application/core/utils/second_app_text_field.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/carts_widgt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ProductCubit(dsl(), dsl(), dsl(), dsl(), dsl())..getcarts(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //in order to stretch width of app material button
            children: [
              Container(
                height: 140,
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'My Cart',
                  style: TextStyles.textStyle34,
                ),
              ),
              const Expanded(child: CartsWidgt()),
              getSecondAppTextfield(
                  appTextFieldInputMdel: AppTextFieldInputMdel(
                      icon: CupertinoIcons.arrow_right,
                      textFieldName: 'Enter Promo Code',
                      context: context,
                      controller: TextEditingController())),
              SizedBoxs.sizedBoxH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total amount:',
                    style: TextStyles.textStyle16grey,
                  ),
                  Text(
                    r'124$',
                    style: TextStyles.textStyle20Bold,
                  )
                ],
              ),
              SizedBoxs.sizedBoxH20,
              appMaterialButton(buttonFunction: () {}, buttonName: 'Check Out')
            ],
          ),
        ));
  }
}
