import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: true,
            create: (context) => DashboardBloc(sl())..add(GetBannerdata())),
        BlocProvider(
            lazy: true,
            create: (context) => ProductCubit(sl(), sl(), sl(), sl(), sl())
              ..getHomeProductsData())
      ],
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: BannerWidgt()),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "products".localization,
                    style: TextStyles.textStyle34(context: context),
                  ),
                  SizedBoxs.sizedBoxw5,
                   Text(
                    "view all".localization,
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
