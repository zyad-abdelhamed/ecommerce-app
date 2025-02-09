import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/second_app_text_field.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ProductCubit(sl(), sl(), sl(), sl(), sl())..getcarts()),
          BlocProvider(
              create: (context) => AddressCubit(
                    sl(),
                    sl(),
                  )..getAddresses())
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //in order to stretch width of app material button
            children: [
              Container(
                height: 140,
                alignment: sl<BaseLocalization>().isarabic()
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                child: Text(
                  "My Cart".localization,
                  style: TextStyles.textStyle34(context: context),
                ),
              ),
              const Expanded(child: CartsWidget()), //cart products bloc builder

              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  final ProductCubit controller = context.read<ProductCubit>();
                  if (controller.totalPrice != 0) {
                    return Column(
                      children: <Widget>[
                        getSecondAppTextfield(
                            appTextFieldInputMdel: AppTextFieldInputMdel(
                                icon: CupertinoIcons.arrow_right,
                                textFieldLabel: "Enter Promo Code".localization,
                                context: context,
                                controller: TextEditingController())),
                        SizedBoxs.sizedBoxH20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total amount:".localization,
                              style: TextStyles.textStyle16grey,
                            ),
                            Text(
                              '${controller.totalPrice.toString()}\$',
                              style: TextStyles.textStyle20Bold,
                            )
                          ],
                        ),
                        SizedBoxs.sizedBoxH20,
                        BlocBuilder<ProductCubit, ProductState>(
                          builder: (context, state) {
                            ProductCubit cubit = context.read<ProductCubit>();
                            AddressCubit addressCubit =
                                context.read<AddressCubit>();
                            return appMaterialButton(
                                buttonFunction: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentPage1(
                                          totalPrice: cubit.totalPrice,
                                          address:
                                              addressCubit.getSelectedAddress,
                                        ),
                                      ));
                                },
                                buttonName: "Check Out".localization);
                          },
                        )
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
