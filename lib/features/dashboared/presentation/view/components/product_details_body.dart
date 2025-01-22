import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                product.name,
                style: TextStyles.textStyle20Bold,
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.price.toString() + r'$',
                            style: TextStyles.textStyleNewPrice,
                          ),
                          Visibility(
                            visible: product.price == product.oldprice
                                ? false
                                : true, //check to display old price or not
                            child: Text(
                              product.oldprice.toString() + r'$',
                              style: TextStyles.textStyleOldPrice,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(10)),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: product.image,
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: ViewConstants.appShadow),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'الوصف:-',
                        style: TextStyles.textStyle20Boldgreen,
                      ),
                      SizedBoxs.sizedBoxH10,
                      Expanded(
                          child: SingleChildScrollView(
                              child: Text(
                        product.description,
                        style: TextStyles.textStyle18black,
                      )))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
