import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/favorites_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(dsl(), dsl(), dsl(), dsl(), dsl())..getFavorites(),
      child: const FavoritesBody(),
    );
  }
}
