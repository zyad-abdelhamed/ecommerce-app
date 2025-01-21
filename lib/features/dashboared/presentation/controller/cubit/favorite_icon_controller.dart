import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:flutter/material.dart';

class FavoriteIconController {
//define variables
  double favoriteIconScale = 1.0;
  Icon favoriteIcon = const Icon(
    Icons.favorite_outline,
    color: Colors.grey,
  );
//get icon and scale
  Icon getFavoritesOrNotFavoritesIcon({required String productId}) {
    if (ProductCubit.favoritesProductsId.contains(productId)) {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    }

    return favoriteIcon;
  }

  double getFavoritesOrNotFavoritesIconScale({required String productId}) {
    if (ProductCubit.favoritesProductsId.contains(productId)) {
      return 1.5;
    }

    return favoriteIconScale;
  }
}
