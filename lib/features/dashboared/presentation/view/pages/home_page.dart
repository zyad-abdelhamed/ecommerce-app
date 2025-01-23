import 'package:ecommerce_application/core/services/dependancy_injection/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/banner_widgt.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/home_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('build home page');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: true,
            create: (context) => DashboardBloc(dsl())..add(GetBannerdata())),
        BlocProvider(
            lazy: true,
            create: (context) => ProductCubit(dsl(), dsl(), dsl(), dsl(), dsl())
              ..getHomeProductsData())
      ],
      child:  CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: BannerWidgt()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'products',
                    style: TextStyles.textStyle34(context: context),
                  ),
                  SizedBoxs.sizedBoxw5,
                  const Text(
                    'view all',
                    style: TextStyles.textStyle18black,
                  )
                ],
              ),
            ),
          ),
          const HomeProducts()
        ],
      ),
    );
  }
}
