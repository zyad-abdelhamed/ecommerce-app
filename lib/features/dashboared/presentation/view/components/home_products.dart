import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_sneak_bar.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/loading_widget.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/cart_cubit.dart';
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
          print('////////////////////////////////////');
          print(ProductCubit.favoritesProductsId);
          final ProductCubit controller = context.read<ProductCubit>();
          switch (state.productsState) {
            case RequestStateEnum.success:
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GridView.builder(
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      mainAxisExtent: context.height * (1 / 2 + 1 / 70)),
                  itemBuilder: (context, index) {
                    return VerticalProductWidget(
                        imageUrl: state.products[index].image,
                        name: state.products[index].name,
                        descreption: state.products[index].description,
                        oldPrice: state.products[index].oldprice.toString(),
                        newPrice: state.products[index].price.toString(),
                        buttonWidget: appMaterialButton(
                            buttonFunction: () {
                              dsl.get<CartCubit>().addOrRemoveProductFromCartF(
                                  productId:
                                      state.products[index].id.toString());
                              print(CartCubit.productsInCart);
                            },
                            buttonName: CartCubit.productsInCart.contains(
                                    state.products[index].id.toString())
                                ? 'remove from cart'
                                : 'add to cart',
                            buttonColor: Colors.black),
                        bottomRightOfStackWidget: InkWell(
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
                        discount:
                            '${state.products[index].discount.toString()}%');
                  },
                ),
              );
            case RequestStateEnum.failed:
              return Center(
                child: Text(state.productsMessage),
              );
            case RequestStateEnum.loading:
              return getLoadingWidget();
          }
        });
  }
}
