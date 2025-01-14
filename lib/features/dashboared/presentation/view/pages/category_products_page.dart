import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/categories_app_bar.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/category_products_body.dart';
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
      create: (context) => ProductCubit(dsl(), dsl(), dsl(),dsl(),dsl())
        ..getProducts(
            categoryId: categoryId, categoryName: categoryName),
      child: Scaffold(
        appBar: categoriesAppBar(titel: categoryName),
        body: const CategoryProductsBody(),
      ),
    );
  }
}
