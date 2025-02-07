import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/widgets/get_app_empty_list_widget.dart';
import 'package:ecommerce_application/core/widgets/get_app_failure_widget.dart';
import 'package:ecommerce_application/core/widgets/loading_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/horizontal_product_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/remove_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsWidget extends StatelessWidget {
  const CartsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit controller = context.read<ProductCubit>();

        switch (state.cartProductsState) {
          case RequestStateEnum.success:
            return state.cartProducts.isEmpty
                ? getAppEmptyListWidget(message: 'Cart is empty')
                : ListView.builder(
                  itemCount: state.cartProducts.length,
                  itemBuilder: (context, index) {
                    return HorizontalProductWidget(
                      isLoading:  (state.load) == index ,
                      buttonWidget: RemoveButtonWidget(
                        removeButtonFunction: () =>
                            controller.addOrRemoveCartProducts(
                              index: index,
                                productId:
                                    state.cartProducts[index].id.toString()),
                      ),
                      productsList: state.cartProducts,
                      index: index,
                    );
                  },
                );

          case RequestStateEnum.failed:
            return getAppFailureWidget(message: state.cartProductsMessage);

          case RequestStateEnum.loading:
            return getLoadingWidget();
        }
      },
    );
  }
}