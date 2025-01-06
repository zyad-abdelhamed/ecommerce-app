import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/banner_widgt.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(dsl())..getProducts(),
        ),
        BlocProvider(
            create: (context) => DashboardBloc(dsl())..add(GetBannerdata())),
      ],
      child:  Scaffold(
        body: Column(
          children: [
            const BannerWidgt(),
            SizedBoxs.sizedBoxH30,
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                       'products',
                        style: TextStyles.textStyle34,
                      ),
                      SizedBoxs.sizedBoxw5,
                      Text(
                        'view all',
                        style: TextStyles.textStyle25.copyWith(color: Colors.black),
                      )
                    ],
                  ),
             ),
            const Expanded(child: ProductWidget())
          ],
        ),
      ),
    );
  }
}
