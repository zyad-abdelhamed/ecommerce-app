import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:flutter/material.dart';

class AddAndRemoveFavoritsButton extends StatelessWidget {
  const AddAndRemoveFavoritsButton({
    super.key,
    required this.controller,
    required this.index,
    required this.productsList,
  });

  final ProductCubit controller;
  final int index;
  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.addAndRemoveFavorites(
          productId: productsList[index].id.toString()),
      child: FavoriteIconWidget(
        scale: dsl
            .get<FavoriteIconController>()
            .getFavoritesOrNotFavoritesIconScale(
                productId: productsList[index].id.toString()),
        icon: dsl.get<FavoriteIconController>().getFavoritesOrNotFavoritesIcon(
            productId: productsList[index].id.toString()),
        productId: productsList[index].id.toString(),
      ),
    );
  }
}
