import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/category_products_body.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/display_products_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsPage extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  const CategoryProductsPage(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => ProductCubit(sl(), sl(), sl(), sl(), sl())
        ..getProducts(categoryId: categoryId, categoryName: categoryName),
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
        ),
        body: const CustomScrollView(slivers: [
          DisplayPrductsIconButtonWidget(),
          CategoryProductsBody()
        ]),
      ),
    );
  }
}
