import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/widgets/loading_widget.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerWidgt extends StatelessWidget {
  const BannerWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) =>
          previous.requestStateEnum != current.requestStateEnum,
      builder: (context, state) {
        print('build banners');
        switch (state.requestStateEnum) {
          case RequestStateEnum.success:
            return CarouselSlider(
                items: state.banners.reversed.map((item) {
                  return SizedBox(
                    width: double.infinity,
                    child: CachedNetworkImage(
                        fit: BoxFit.fill, imageUrl: item.image),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: context.height * 1 / 4,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: ViewConstants.itervalDuration,
                  autoPlayAnimationDuration:
                      ViewConstants.cartAndAutoPlayAnimationDuration,
                  autoPlayCurve: Curves.easeInOut,
                  enableInfiniteScroll: true,

                  pauseAutoPlayOnTouch: true,
                  // pauseAutoPlayInFiniteScroll: true
                ));
          case RequestStateEnum.failed:
            return Center(
              child: Text(state.errorMessage),
            );
          case RequestStateEnum.loading:
            return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.height * 1 / 8,
                ),
                child: getLoadingWidget());
        }
      },
    );
  }
}
