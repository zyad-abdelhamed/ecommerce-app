import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_sneak_bar.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/loading_widget.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/vertical_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          final ProductCubit controller = context.read<ProductCubit>();
          switch (state.productsState) {
            case RequestStateEnum.success:
              return SliverGrid.builder(
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.0,
                    mainAxisExtent: context.height * .45,
                    ),
                itemBuilder: (context, index) {
                  return VerticalProductWidget(
                      index: index,
                      productsList: state.products,
                      //cart button
                      buttonWidget: appMaterialButton(
                          buttonFunction: () {
                            controller.addOrRemoveCartProducts(
                                productId:
                                    state.products[index].id.toString());
                          },
                          buttonName: controller.getCartButtonName(productId: state.products[index].id.toString()),
                          buttonColor: Colors.black),
                          //favorites
                      bottomRightOfStackWidget: GestureDetector(
                        onTap: () =>  controller.addAndRemoveFavorites(
                                productId:
                                    state.products[index].id.toString()),
                        child: FavoriteIconWidget(  
                          scale: dsl
                              .get<FavoriteIconController>()
                              .getFavoritesOrNotFavoritesIconScale(
                                  productId:
                                      state.products[index].id.toString()),
                          icon: dsl
                              .get<FavoriteIconController>()
                              .getFavoritesOrNotFavoritesIcon(
                                  productId:
                                      state.products[index].id.toString()),
                          productId: state.products[index].id.toString(),
                        ),
                      ),
                      );
                },
              );
            case RequestStateEnum.failed:
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(state.productsMessage),
                ),
              );
            case RequestStateEnum.loading:
              return SliverToBoxAdapter(child: getLoadingWidget());
          }
        });
  }
}
