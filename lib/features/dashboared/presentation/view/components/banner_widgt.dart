import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/loading_widget.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerWidgt extends StatelessWidget {
  const BannerWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => previous.banners != current.banners,
      builder: (context, state) {
        switch (state.requestStateEnum) {
          case RequestStateEnum.success:
            return FadeIn(
                child: CarouselSlider(
                    items: state.banners.reversed.map((item) {
                      return SizedBox(
                        width: double.infinity,
                        child: CachedNetworkImage(
                            fit: BoxFit.fill, imageUrl: item.image),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: context.height * 1/4,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: ViewConstants.itervalDuration,
                      autoPlayAnimationDuration: ViewConstants.animationDuration,
                      autoPlayCurve: Curves.easeInOut,
                      enableInfiniteScroll: true,

                      pauseAutoPlayOnTouch: true,
                      // pauseAutoPlayInFiniteScroll: true
                    )));
          case RequestStateEnum.failed:
            return Center(
              child: Text(state.errorMessage),
            );
          case RequestStateEnum.loading:
            return getLoadingWidget();
        }
      },
    );
  }
}
