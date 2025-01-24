import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/add_and_remove_cart_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return BlocProvider(
                lazy: true,
                create: (context) =>
                    ProductCubit(sl(), sl(), sl(), sl(), sl()),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {
                                  for (int i = 0; i < 2; i++) {
                                    context.pop();
                                  }
                                },
                                icon: const Icon(Icons.arrow_back_ios_new)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: InkWell(
                          onTap: () => context.pop(),
                          child: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: BlocBuilder<ProductCubit, ProductState>(
                          builder: (context, state) {
                            final ProductCubit controller =
                                context.read<ProductCubit>();

                            return Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share_outlined,
                                      )), //share product
                                  GestureDetector(
                                    onTap: () =>
                                        controller.addOrRemoveCartProducts(
                                            productId: product.id.toString()),
                                    child: AddAndRemoveCartWidget(
                                        containerOfCartColor:
                                            controller.getCartContainerColor(
                                                productId:
                                                    product.id.toString())),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        controller.addAndRemoveFavorites(
                                            productId: product.id.toString()),
                                    child: FavoriteIconWidget(
                                      scale: sl
                                          .get<FavoriteIconController>()
                                          .getFavoritesOrNotFavoritesIconScale(
                                              productId: product.id.toString()),
                                      icon: sl
                                          .get<FavoriteIconController>()
                                          .getFavoritesOrNotFavoritesIcon(
                                              productId: product.id.toString()),
                                      productId: product.id.toString(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: ProductDetailsBody(product: product),
    );
  }
}
