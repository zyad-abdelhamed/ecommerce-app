import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/get_products_ethier_vertical_or_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
     // buildWhen: (previous, current) => previous.productsState != current.productsState,
      builder: (context, state) {
        final ProductCubit controller = context.read<ProductCubit>();
         print('build category products');
        return SliverGrid.builder(
          itemCount: state.products.length,
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
                productsList: state.products,
                controller: controller,
                buttonWidget: appMaterialButton(
            buttonFunction: () {
              controller.addOrRemoveCartProducts(
                  productId: state.products[index].id.toString());
            },
            buttonName: controller.getCartButtonName(
                productId: state.products[index].id.toString()),
            buttonColor: Colors.black),
            bottomRightOfStackWidget: InkWell(
          onTap: () => controller.addAndRemoveFavorites(
              productId: state.products[index].id.toString()),
          child: FavoriteIconWidget(
            scale: dsl
                .get<FavoriteIconController>()
                .getFavoritesOrNotFavoritesIconScale(
                    productId: state.products[index].id.toString()),
            icon: dsl
                .get<FavoriteIconController>()
                .getFavoritesOrNotFavoritesIcon(
                    productId: state.products[index].id.toString()),
            productId: state.products[index].id.toString(),
          ),
        )
                );
          },
        );
      },
    );
  }
}
