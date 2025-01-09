import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/loading_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/cart_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorite_icon_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/horizontal_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartsWidgt extends StatelessWidget {
  const CartsWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => previous.carts != current.carts,
      builder: (context, state) {
        
        //CartCubit cubit = context.read<CartCubit>();
        switch (state.requestStateEnum) {
          case RequestStateEnum.success:
            return state.carts.isEmpty
                ? const Center(
                    child: Text('Cart is empty'),
                  )
                : ListView.builder(
                    itemCount: state.carts.length,
                    itemBuilder: (context, index) {
                      return HorizontalProductWidget(
                        buttonWidget: OutlinedButton(
                            onPressed: () {
                              // cubit.addOrRemoveProductFromCart(parameters: );
                              // cubit.getcarts();
                            },
                            child: const Text(
                              'remove from cart',
                              style: TextStyle(color: Colors.black),
                            )),
                        imageUrl: state.carts[index].image,
                        name: state.carts[index].name,
                        descreption: state.carts[index].description,
                        oldPrice: state.carts[index].oldprice.toString(),
                        newPrice: state.carts[index].price.toString(),
                        bottomRightOfStackWidget: const FavoriteIconWidget(productId: '53',
                            scale: 1, icon: Icon(FontAwesomeIcons.heart)),
                      );
                    },
                  );
          case RequestStateEnum.failed:
            return Center(
              child: Text(state.message),
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
