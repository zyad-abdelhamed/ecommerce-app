import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/horizontal_product_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/vertical_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit controller = context.read<ProductCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //icon
            SizedBox(
              height: context.height * .10,
              child: IconButton(
                  onPressed: () {
                    controller.changeProductsDisplay(
                        );
                  },
                  icon:  Icon(controller.crossAxisCount==1?Icons.grid_3x3 :Icons.list)),
            ),
            //begin of gridview
            Expanded(
              child: GridView.builder(
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: controller.crossAxisCount,
                     crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                    mainAxisExtent: controller.crossAxisCount==1?
   context.height * 1 / 6 + 20  :
     context.height * .45
    ),
                itemBuilder: (context, index) {
              return  controller.crossAxisCount == 1?HorizontalProductWidget(
                      buttonWidget: appMaterialButton(
                          buttonFunction: () {},
                          buttonName: 'add to cart',
                          buttonColor: Colors.black),
                      productsList: state.products,
                      index: index,
                      bottomRightOfStackWidget: InkWell(
                        onTap: () => controller.addAndRemoveFavorites(
                            productId: state.products[index].id.toString()),
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
                      )):VerticalProductWidget(productsList: state.products, index: index, buttonWidget: appMaterialButton(
                          buttonFunction: () {},
                          buttonName: 'add to cart',
                          buttonColor: Colors.black), bottomRightOfStackWidget:  InkWell(
                        onTap: () => controller.addAndRemoveFavorites(
                            productId: state.products[index].id.toString()),
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
                      ));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
