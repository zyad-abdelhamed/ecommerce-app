import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    required this.state,
    required this.controller,
    required this.index,
  });

  final AddressState state;
  final AddressCubit controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.0,
          children: [
            Text(
              state.addresses[index].name,
              style: TextStyles.textStyle18black,
            ),
            Text(
              '${state.addresses[index].city} \n${state.addresses[index].region}',
            ),
            Row(
              children: [
                Checkbox(
                  side: const BorderSide(color: AppColors.greyDesignColor),
                  value: controller.selectedCheckBox == index,
                  activeColor: AppColors.greenDesignColor,
                  onChanged: (value) =>
                      controller.changeSelectedCheckBox(index: index),
                ),
                const Text('Use as the shipping address'),
              ],
            )
          ],
        ),
      ],
    );
  }
}
