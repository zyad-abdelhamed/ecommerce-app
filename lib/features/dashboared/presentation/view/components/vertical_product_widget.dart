import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_sneak_bar.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/cart_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerticalProductWidget extends StatelessWidget {
  const VerticalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(listener: (context, state) {
      if (state.addAndRemoveFavoritesState == RequestStateEnum.failed) {
        appSneakBar(
            context: context,
            message: state.addAndRemoveFavoritesMessage,
            isError: true);
      }
    }, builder: (context, state) {
      final ProductCubit controller = context.read<ProductCubit>();

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
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: context.height * 1 / 4,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: state.products[index].image,
                              fit: BoxFit.fill,
                            ))),
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 222, 73, 43),
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        child: Text(
                          '${state.products[index].discount.toString()}%',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: InkWell(
                        onTap: () {
                          controller.addAndRemoveFavorites(
                              productId: state.products[index].id.toString());
                        },
                        child: FavoriteIconWidget(
                          icon: dsl
                              .get<FavoriteIconCubit>()
                              .getFavoritesOrNotFavoritesIcon(
                                  productId:
                                      state.products[index].id.toString()),
                          scale: dsl
                              .get<FavoriteIconCubit>()
                              .getFavoritesOrNotFavoritesIconScale(
                                  productId:
                                      state.products[index].id.toString()),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  maxLines: 2,
                  state.products[index].description,
                  style: TextStyles.textStyle25g
                      .copyWith(overflow: TextOverflow.ellipsis, fontSize: 15),
                ),
                Text(
                  maxLines: 2,
                  state.products[index].name,
                  style: TextStyles.textStyle34
                      .copyWith(overflow: TextOverflow.ellipsis, fontSize: 18),
                ),
                Row(
                  children: [
                    Text(
                      state.products[index].oldprice.toString(),
                      style: TextStyles.textStyleOldPrice,
                    ),
                    SizedBoxs.sizedBoxw5,
                    Text(
                      state.products[index].price.toString(),
                      style: TextStyles.textStyleNewPrice,
                    )
                  ],
                ),
                appMaterialButton(
                    buttonFunction: () {
                      dsl.get<CartCubit>().addOrRemoveProductFromCartF(
                          productId: state.products[index].id.toString());
                     

                      // cubit.addOrRemoveProductFromCart(productId:state.products[index].id.toString() );
                      // cubit.addOrRemoveIdInSetOfProductInCart(productId:state.products[index].id.toString() );
                      print(
                          "${dsl.get<CartCubit>().productsInCart}>>>>>>>>>>>>>>>>>>");
                    },
                    buttonName: dsl
                            .get<CartCubit>()
                            .productsInCart
                            .contains(state.products[index].id.toString())
                        ? 'remove from cart'
                        : 'add to cart',
                    buttonColor: Colors.black)
              ],
            );
          },
        ),
      );
    });
  }
}
