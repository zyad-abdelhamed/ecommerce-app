import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/widgets/get_app_failure_widget.dart';
import 'package:ecommerce_application/core/widgets/loading_widget.dart';
import 'package:ecommerce_application/core/extentions/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/categories_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/pages/category_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidgt extends StatelessWidget {
  const CategoriesWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        switch (state.requestStateEnum) {
          case RequestStateEnum.success:
            return ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProductsPage(
                                categoryId: state.categories[index].id,
                                categoryName: state.categories[index].name),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: context.height * 1 / 9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.whiteOrBlackDesignColor),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  state.categories[index].name,
                                  style: TextStyles.textStyle20Bold,
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                  child: CachedNetworkImage(
                                    imageUrl: state.categories[index].image,
                                    fit: BoxFit.fill,
                                  )))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          case RequestStateEnum.failed:
            return getAppFailureWidget(message: state.message);
          case RequestStateEnum.loading:
            return Center(
              child: getLoadingWidget(),
            );
        }
      },
    );
  }
}
