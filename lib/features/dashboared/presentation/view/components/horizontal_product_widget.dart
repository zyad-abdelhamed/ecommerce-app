import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/product_details_widget.dart';
import 'package:flutter/material.dart';

class HorizontalProductWidget extends StatelessWidget {
  //define variabels
  final Widget buttonWidget;
  final Widget bottomRightOfStackWidget;
  final List<Product> productsList;
  final int index;
  //constructor
  const HorizontalProductWidget(
      {super.key,
      required this.buttonWidget,
      required this.productsList,
      required this.index,
      required this.bottomRightOfStackWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //begin bottom of stack
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: ViewConstants.appShadow,
          ),
          height: context.height * 1 /6,
          margin: const EdgeInsets.all(10.0),
          width: double.infinity,
          child: Row(
            children: [
              //image
              SizedBox(
                  width: context.width * 1 / 3.5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    child: CachedNetworkImage(
                      imageUrl: productsList[index].image,
                      fit: BoxFit.fill,
                    ),
                  )),
              //column
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: ProductDetailsWidget(
                    maxLines: 1,
                    buttonWidget: buttonWidget,
                    name: productsList[index].name,
                    descreption: productsList[index].description,
                    oldPrice: productsList[index].oldprice.toString(),
                    newPrice: productsList[index].price.toString(),
                  ),
                ),
              )
            ],
          ),
        ),
        //end bottom of stack
        //bottom right of stack
        Positioned(bottom: 0.0, right: 0.0, child: bottomRightOfStackWidget)
      ],
    );
  }
}
