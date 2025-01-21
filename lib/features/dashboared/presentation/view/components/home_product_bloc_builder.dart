import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/add_and_remove_cart_button.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/add_and_remove_favorites_button.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/vertical_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductBlocBuilder extends StatelessWidget {
  const HomeProductBlocBuilder({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        print(state);
        final ProductCubit controller = context.read<ProductCubit>();
        print('build home (for favorites or cart) one product');
        return VerticalProductWidget(
          index: index,
          productsList: state.products,
          //cart button
          buttonWidget: AddAndRemoveCartButton(
              controller: controller,
              index: index,
              productsList: state.products),
          //favorites
          bottomRightOfStackWidget: AddAndRemoveFavoritsButton(
            controller: controller,
            index: index,
            productsList: state.products,
          ),
        );
      },
    );
  }
}
