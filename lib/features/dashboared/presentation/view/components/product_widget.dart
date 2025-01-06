import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
              final controller = context.read<AuthCubit>();

        return Scaffold(
          body: Container(
            height: 400,
            width: 150,
            margin: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: AspectRatio(
                            aspectRatio: 1 / 1.5,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/test.jpg',
                                  fit: BoxFit.fill,
                                )))),
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 222, 73, 43),
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        child: const Text(
                          '-20%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: InkWell(onTap:() { controller.c == Colors.grey? controller.d():controller.f();},
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
                              scale:controller.scale,
                              duration: const Duration(milliseconds: 500),
                              child: Icon(
                                Icons.favorite_outline,
                                color: controller.c,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'product',
                  style: TextStyles.textStyle25,
                ),
                const Text(
                  'product',
                  style: TextStyles.textStyle34,
                ),
                const Row(
                  children: [
                    Text(
                      '15',
                      style: TextStyles.textStyleOldPrice,
                    ),
                    SizedBoxs.sizedBoxw5,
                    Text(
                      '12',
                      style: TextStyles.textStyleNewPrice,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
