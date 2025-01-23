import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => context.push('/AddAddressPage') ,
      child: const CircleAvatar(
        backgroundColor: AppColors.blackDesignColor,
        child: Icon(
          Icons.add,
          color: AppColors.whiteDesignColor,
          size: 30,
        ),
      ),
    );
  }
}