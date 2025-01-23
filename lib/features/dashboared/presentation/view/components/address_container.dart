import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/address.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key, required this.addressEntity, required this.index,
  });
final List<AddressEntity> addressEntity;
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
              addressEntity[index].name,
              style: TextStyles.textStyle18black,
            ),
             Text(
              '${addressEntity[index].city} \n${addressEntity[index].region}',
            ),
            Row(
              children: [
                Checkbox(side: const BorderSide(color: AppColors.greyDesignColor),
                  value: false,
                  activeColor: AppColors.blackDesignColor,
                  onChanged: (value) {},
                ),
                const Text('Use as the shipping address'),
              ],
            )
          ],
        ),
        const Text(
          'Edit',
          style: TextStyles.textStyleNewPrice,
        )
      ],
    );
  }
}
