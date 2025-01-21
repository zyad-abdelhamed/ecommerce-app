import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/categories_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/categories_widgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => CategoriesCubit(dsl(),dsl())..getCategories(),
      child: Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('categories'),
            ),
            body: const CategoriesWidgt()),
      ),
    );
  }
}
