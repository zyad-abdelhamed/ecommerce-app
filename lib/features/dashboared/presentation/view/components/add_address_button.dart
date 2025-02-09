import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'AddShippingAddress'),
      child:  Icon(
        Icons.add,
        color: AppColors.whiteOrBlackDesignColor,
      ),
    );
  }
}
