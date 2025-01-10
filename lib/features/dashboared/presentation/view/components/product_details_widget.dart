import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatelessWidget {
  final int maxLines;
  final String name, descreption, oldPrice, newPrice;
  final Widget buttonWidget;
  const ProductDetailsWidget({
    super.key,
    required this.maxLines,
    required this.name,
    required this.descreption,
    required this.oldPrice,
    required this.newPrice,
    required this.buttonWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: maxLines,
          name,
          style: TextStyles.textStyle34
              .copyWith(overflow: TextOverflow.ellipsis, fontSize: 18),
        ),
        Text(
          maxLines: maxLines,
          descreption,
          style: TextStyles.textStyle18grey
              .copyWith(overflow: TextOverflow.ellipsis, fontSize: 15),
        ),
        Row(
          children: [
            Text(
              oldPrice,
              style: TextStyles.textStyleOldPrice,
            ),
            SizedBoxs.sizedBoxw5,
            Text(
              newPrice,
              style: TextStyles.textStyleNewPrice,
            )
          ],
        ),
        buttonWidget
      ],
    );
  }
}
