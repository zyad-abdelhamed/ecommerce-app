import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/horizontal_product_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/remove_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.favoritesProducts.length,
          itemBuilder: (context, index) {
         return   HorizontalProductWidget(
              buttonWidget: const RemoveButtonWidget(),
              bottomRightOfStackWidget: const Icon(Icons.badge_sharp),
              productsList: state.favoritesProducts,
              index: index,
            );
          },
        );
      },
    );
  }
}
