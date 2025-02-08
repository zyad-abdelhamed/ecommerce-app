import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsWidget extends StatelessWidget {
  final int maxLines;
  final Product product;
  final Widget buttonWidget;
  const ProductDetailsWidget({
    super.key,
    required this.maxLines,
    required this.product,
    required this.buttonWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            maxLines: maxLines,
            product.name,
            style: TextStyles.textStyle20Bold
            // .copyWith(overflow: TextOverflow.ellipsis, fontSize: 18),
            ),
        Text(
          maxLines: 1,
          product.description,
          style: TextStyles.textStyle18grey
              .copyWith(overflow: TextOverflow.ellipsis, fontSize: 15),
        ),
        Row(
          children: <Widget>[
            Visibility(
              visible: product.price == product.oldprice
                  ? false
                  : true, //check to display old price or not
              child: Text(
                product.oldprice.toString(),
                style: TextStyles.textStyleOldPrice,
              ),
            ),
            SizedBoxs.sizedBoxw5,
            Text(
              product.price.toString(),
              style: TextStyles.textStyleNewPrice,
            )
          ],
        ),
        Flexible(
            child: buttonWidget) //flexible in order to bottom over flow issue
      ],
    );
  }
}
