import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/horizontal_product_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/vertical_product_widget.dart';
import 'package:flutter/material.dart';

Widget getProductsEthierVerticalOrHorizontal(
    {required int crossAxisCount,
    required int index,
    required List<Product> productsList,
    required ProductCubit controller,
    required Widget bottomRightOfStackWidget,
    required Widget buttonWidget}) {
  if (crossAxisCount == 1) {
    return HorizontalProductWidget(
        buttonWidget: buttonWidget,
        productsList: productsList,
        index: index,
        bottomRightOfStackWidget: bottomRightOfStackWidget);
  }
  return VerticalProductWidget(
    productsList: productsList,
    index: index,
    buttonWidget: buttonWidget,
    bottomRightOfStackWidget: bottomRightOfStackWidget,
  );
}
