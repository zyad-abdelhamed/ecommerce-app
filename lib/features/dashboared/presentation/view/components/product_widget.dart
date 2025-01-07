import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      final ProductCubit controller = context.read<ProductCubit>();
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GridView.builder(itemCount: state.products.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
             mainAxisExtent: context.height * (1/2 + 1/70)
              ),
          itemBuilder: (context, index) {
            return Column(mainAxisAlignment:MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(height: context.height * 1/4 ,width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(imageUrl: state.products[index].image ,fit: BoxFit.fill,))),
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 222, 73, 43),
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        child:  Text(
                          '${state.products[index].discount.toString()}%',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: InkWell(
                        onTap: () {controller.changeFavoriteIconWithAnimation();},
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      offset: const Offset(0, 4),
                                      spreadRadius: 2,
                                      color: Colors.grey.withOpacity(0.3))
                                ]),
                            child: AnimatedScale(
                              scale: controller.scale,
                              duration: const Duration(milliseconds: 500),
                              child: controller.favoriteIcon,
                            )),
                      ),
                    ),
                  ],
                ),
                 Text(maxLines: 2,
                  state.products[index].description,
                  style: TextStyles.textStyle25g.copyWith(overflow: TextOverflow.ellipsis,fontSize: 15),
                                 ),
                 Text(maxLines: 2,
                  state.products[index].name,
                  style: TextStyles.textStyle34.copyWith(overflow: TextOverflow.ellipsis,fontSize: 18),
                ),
                 Row(
                  children: [
                    Text(
                      state.products[index].oldprice.toString(),
                      style: TextStyles.textStyleOldPrice,
                    ),
                    SizedBoxs.sizedBoxw5,
                    Text(
                      state.products[index].price.toString(),
                      style: TextStyles.textStyleNewPrice,
                    )
                  ],
                ),
                appMaterialButton(buttonFunction: () {
                  
                }, buttonName: 'add to cart',buttonColor: Colors.black)
              ],
            );
          },
        ),
      );
    });
  }
}
