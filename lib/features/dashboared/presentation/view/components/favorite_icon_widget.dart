import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatelessWidget {
  final double scale;
  final Widget icon;
  const FavoriteIconWidget({
    super.key,
    required this.scale,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
