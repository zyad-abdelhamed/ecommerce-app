import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/display_products_icon_button_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorites_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) =>
          ProductCubit(dsl(), dsl(), dsl(), dsl(), dsl())..getFavorites(),
      child:  CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 100, left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              'favorites',
              style: TextStyles.textStyle34(context: context),
            ),
          ),
        ),
        const DisplayPrductsIconButtonWidget(),
        const FavoritesBody()
      ]),
    );
  }
}
