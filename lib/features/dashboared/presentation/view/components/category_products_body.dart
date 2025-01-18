import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/categories_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/horizontal_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
            //begin of gridview
            Expanded(
              child: GridView.builder(
                itemCount: state.categoryProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: context.height * 1 / 6 + 20),
                itemBuilder: (context, index) {
                  return HorizontalProductWidget(
                      buttonWidget: appMaterialButton(
                          buttonFunction: () {},
                          buttonName: 'add to cart',
                          buttonColor: Colors.black),
                      imageUrl: state.categoryProducts[index].image,
                      name: state.categoryProducts[index].name,
                      descreption: state.categoryProducts[index].description,
                      oldPrice:
                          state.categoryProducts[index].oldprice.toString(),
                      newPrice: state.categoryProducts[index].price.toString(),
                      bottomRightOfStackWidget:  FavoriteIconWidget(
                  scale: dsl
                      .get<FavoriteIconController>()
                      .getFavoritesOrNotFavoritesIconScale(
                          productId: state.categoryProducts[index].id.toString()),
                  icon: dsl
                      .get<FavoriteIconController>()
                      .getFavoritesOrNotFavoritesIcon(
                          productId: state.categoryProducts[index].id.toString()),
                  productId: state.categoryProducts[index].id.toString(),
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
