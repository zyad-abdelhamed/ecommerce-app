import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconWidget extends StatelessWidget {
  final double scale;
  final Widget icon;
  final String productId;
  const FavoriteIconWidget({
    super.key,
    required this.scale,
    required this.icon,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit controller = context.read<ProductCubit>();

        return GestureDetector(
          onTap: () {
            controller.addAndRemoveFavorites(productId: productId);
          },
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                        spreadRadius: 2,
                        color: Colors.grey.withOpacity(0.3))
                  ]),
              child: AnimatedScale(
                scale: scale,
                duration: const Duration(milliseconds: 500),
                child: icon,
              )),
        );
      },
    );
  }
}
