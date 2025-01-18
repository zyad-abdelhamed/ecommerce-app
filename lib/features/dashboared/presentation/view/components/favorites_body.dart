import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/add_and_remove_cart_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/get_products_ethier_vertical_or_horizontal.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/remove_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      // listener: (context, state) {},
      builder: (context, state) {
        final ProductCubit controller = context.read<ProductCubit>();

        return SliverGrid.builder(
          itemCount: state.favoritesProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.crossAxisCount,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              mainAxisExtent: state.crossAxisCount == 1
                  ? context.height * 1 / 6 + 20
                  : context.height * .45),
          itemBuilder: (context, index) {
            return getProductsEthierVerticalOrHorizontal(
              crossAxisCount: state.crossAxisCount,
              index: index,
              productsList: state.favoritesProducts,
              controller: controller,
              buttonWidget: RemoveButtonWidget(
                removeButtonFunction: () => controller.addAndRemoveFavorites(
                    productId: state.favoritesProducts[index].id.toString()),
              ),
              bottomRightOfStackWidget: GestureDetector(
                onTap: () => controller.addOrRemoveCartProducts(
                    productId: state.favoritesProducts[index].id.toString()),
                child: AddAndRemoveCartWidget(
                    containerOfCartColor: controller.getCartContainerColor(
                        productId:
                            state.favoritesProducts[index].id.toString())),
              ),
            );
          },
        );
      },
    );
  }
}
