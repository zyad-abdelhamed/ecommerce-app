import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/product_details_widget.dart';
import 'package:flutter/material.dart';

class VerticalProductWidget extends StatelessWidget {
  //define variabels
  final String imageUrl, name, descreption, oldPrice, newPrice, discount;
  final Widget buttonWidget;
  final Widget bottomRightOfStackWidget;
  //constructor
  const VerticalProductWidget(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.descreption,
      required this.oldPrice,
      required this.newPrice,
      required this.buttonWidget,
      required this.bottomRightOfStackWidget,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
                height: context.height * 1 / 4,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                    ))),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 73, 43),
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                child: Text(
                  discount,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(bottom: 0.0, right: 0.0, child: bottomRightOfStackWidget),
          ],
        ),
        //begin of column
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: ProductDetailsWidget(
              maxLines: 1,
              buttonWidget: buttonWidget,
              name: name,
              descreption: descreption,
              oldPrice: oldPrice,
              newPrice: newPrice,
            ),
          ),
        )
      ],
    );
  }
}
