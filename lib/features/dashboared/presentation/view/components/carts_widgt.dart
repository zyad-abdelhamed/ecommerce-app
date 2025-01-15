import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/loading_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/horizontal_product_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/remove_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsWidgt extends StatelessWidget {
  const CartsWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
    //  buildWhen: (previous, current) => previous.carts != current.carts,
      builder: (context, state) {
        
      //final  CartCubit cubit = context.read<CartCubit>();
        
        switch (state.cartProductsState) {
          case RequestStateEnum.success:
            return state.cartProducts.isEmpty
                ? const Center(
                    child: Text('Cart is empty'),
                  )
                : ListView.builder(
                    itemCount: state.cartProducts.length,
                    itemBuilder: (context, index) {
                      return HorizontalProductWidget(
                        buttonWidget: const RemoveButtonWidget(),
                        productsList: state.cartProducts,
                        index: index,
                        bottomRightOfStackWidget:  FavoriteIconWidget(
                            scale: dsl
                                .get<FavoriteIconController>()
                                .getFavoritesOrNotFavoritesIconScale(
                                    productId:
                                        state.cartProducts[index].id.toString()),
                            icon: dsl
                                .get<FavoriteIconController>()
                                .getFavoritesOrNotFavoritesIcon(
                                    productId:
                                        state.cartProducts[index].id.toString()),
                            productId: state.cartProducts[index].id.toString(),),
                      );
                    },
                  );
          case RequestStateEnum.failed:
            return Center(
              child: Text(state.cartProductsMessage),
            );
          case RequestStateEnum.loading:
            return Center(
              child: getLoadingWidget(),
            );
        }
      },
    );
  }
}
