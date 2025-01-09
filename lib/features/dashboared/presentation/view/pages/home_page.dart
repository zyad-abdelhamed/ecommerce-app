import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/banner_widgt.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/vertical_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(dsl(),dsl())..getHomeProducts(),
        ),
        BlocProvider(
            create: (context) => DashboardBloc(dsl())..add(GetBannerdata())),
       
      ],
      child:  const Scaffold(
        body: Column(
          children: [
            BannerWidgt(),
             SizedBoxs.sizedBoxH10,
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 15.0),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       'products',
                        style: TextStyles.textStyle34,
                      ),
                      SizedBoxs.sizedBoxw5,
                      Text(
                        'view all',
                        style: TextStyles.textStyle25b,
                      )
                    ],
                  ),
             ),
            Expanded(child: VerticalProductWidget())
          ],
        ),
      ),
    );
  }
}
