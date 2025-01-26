import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/product_details_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/product_details_page.dart';
import 'package:flutter/material.dart';

class VerticalProductWidget extends StatelessWidget {
  //define variabels
  final List<Product> productsList;
  final int index;
  final Widget buttonWidget;
  final Widget bottomRightOfStackWidget;
  //constructor
  const VerticalProductWidget({
    super.key,
    required this.productsList,
    required this.index,
    required this.buttonWidget,
    required this.bottomRightOfStackWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
            product: productsList[index]), //go to product details page
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: productsList[index].image,
                            fit: BoxFit.fill,
                          ))),
                  Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: productsList[index].discount !=
                              0 //check discount = 0 or not
                          ? Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 222, 73, 43),
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 10, right: 10),
                              child: Text(
                                '${productsList[index].discount.toString()}%',
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          : const SizedBox()),
                  Positioned(
                      bottom: 0.0, right: 0.0, child: bottomRightOfStackWidget),
                ],
              ),
            ),
            //begin of column
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: ProductDetailsWidget(
                  maxLines: 2,
                  buttonWidget: buttonWidget,
                  product: productsList[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
