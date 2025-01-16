import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddAndRemoveCartWidget extends StatelessWidget {
  final Color containerOfCartColor;
  const AddAndRemoveCartWidget({super.key, required this.containerOfCartColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: ViewConstants.cartAndAutoPlayAnimationDuration,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: containerOfCartColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: ViewConstants.appShadow),
      child: const Icon(
        FontAwesomeIcons.cartShopping,
        color: Colors.white,
      ),
    );
  }
}
