import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/extentions/responsive_extention.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/product_details_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalProductWidget extends StatelessWidget {
  //define variabels
  final Widget buttonWidget;
  final Widget? bottomRightOfStackWidget;
  final List<Product> productsList;
  final int index;
  final bool isLoading;
  //constructor
  const HorizontalProductWidget(
      {super.key,
      required this.buttonWidget,
      this.isLoading = false,
      required this.productsList,
      required this.index,
      this.bottomRightOfStackWidget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
            product: productsList[index]), //go to product details page
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Skeletonizer(
          enabled: isLoading,
          child: Stack(
            children: [
              //begin bottom of stack
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteOrBlackDesignColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: ViewConstants.appShadow,
                ),
                height: context.height * 1 / 6,
                margin: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: Row(
                  children: [
                    //image
                    SizedBox(
                        width: context.width * 1 / 3.5,
                        height: double.infinity,
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
                        padding: const EdgeInsets.all(10.0),
                        child: ProductDetailsWidget(
                          maxLines: 1,
                          buttonWidget: buttonWidget,
                          product: productsList[index],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //end bottom of stack
              /////////////////////////////////////////////////////////
              //begin top of stack
              //discount
              Align(
                alignment: sl<BaseLocalization>().isarabic()
                    ? Alignment.topRight
                    : Alignment.topLeft,
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
                    : const SizedBox(),
              ),
              //widget of bottom right of stack
              Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: bottomRightOfStackWidget ?? const SizedBox())
              //end top of stack
            ],
          ),
        ),
      ),
    );
  }
}
