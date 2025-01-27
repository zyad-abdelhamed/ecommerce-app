import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/core/widgets/second_app_text_field.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/carts_widgt.dart';
import 'package:ecommerce_application/features/payment_integration/presentation/views/pages/payment_page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) =>
            ProductCubit(sl(), sl(), sl(), sl(), sl())..getcarts(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //in order to stretch width of app material button
            children: [
              Container(
                height: 140,
                alignment: Alignment.bottomLeft,
                child: Text(
                  'My Cart',
                  style: TextStyles.textStyle34(context: context),
                ),
              ),
              const Expanded(child: CartsWidgt()), //cart products bloc builder
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
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      final ProductCubit controller =
                          context.read<ProductCubit>();

                      return Text(
                        '${controller.totalPrice.toString()}\$',
                        style: TextStyles.textStyle20Bold,
                      );
                    },
                  )
                ],
              ),
              SizedBoxs.sizedBoxH20,
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  ProductCubit cubit = context.read<ProductCubit>();
                  return appMaterialButton(
                      buttonFunction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage1(
                                totalPrice: cubit.totalPrice,
                              ),
                            ));
                      },
                      buttonName: 'Check Out');
                },
              )
            ],
          ),
        ));
  }
}
