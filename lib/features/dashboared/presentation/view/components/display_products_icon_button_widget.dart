import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayPrductsIconButtonWidget extends StatelessWidget {
  const DisplayPrductsIconButtonWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
                final ProductCubit controller = context.read<ProductCubit>();

        return SliverToBoxAdapter(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  controller.changeProductsDisplay();
                },
                icon: state.displayProductsIcon),
          ),
        );
      },
    );
  }
}
