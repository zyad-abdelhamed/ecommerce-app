import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:flutter/material.dart';

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
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            boxShadow: ViewConstants.appShadow),
        child: AnimatedScale(
          scale: scale,
          duration: ViewConstants.favoritesAnimationDuration,
          child: icon,
        ));
  }
}
