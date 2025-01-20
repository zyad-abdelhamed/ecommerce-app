import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/widgets/loading_widget.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/home_product_bloc_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
        buildWhen: (previous, current) =>
            previous.productsState != current.productsState,
        builder: (context, state) {
          print('bulid home products');
          switch (state.productsState) {
            case RequestStateEnum.success:
              return SliverGrid.builder(
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.0,
                    mainAxisExtent: context.height * .45,
                  ),
                  itemBuilder: (context, index) {
                    return HomeProductBlocBuilder(
                      index: index,
                    );
                  });
            case RequestStateEnum.failed:
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(state.productsMessage),
                ),
              );
            case RequestStateEnum.loading:
              return SliverToBoxAdapter(child: getLoadingWidget());
          }
        });
  }
}
