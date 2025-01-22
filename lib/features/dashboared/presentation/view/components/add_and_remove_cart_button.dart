import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:flutter/material.dart';

class AddAndRemoveCartButton extends StatelessWidget {
  const AddAndRemoveCartButton(
      {super.key,
      required this.controller,
      required this.index,
      required this.productsList});
  final ProductCubit controller;
  final int index;
  final List<Product> productsList;
  @override
  Widget build(BuildContext context) {
    return appMaterialButton(
        buttonFunction: () {
          controller.addOrRemoveCartProducts(
              productId: productsList[index].id.toString());
        },
        buttonName: controller.getCartButtonName(
            productId: productsList[index].id.toString()),
        buttonColor: Colors.black);
  }
}
