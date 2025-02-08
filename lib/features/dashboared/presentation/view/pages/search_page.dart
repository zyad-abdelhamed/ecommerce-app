import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/second_app_text_field.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/add_and_remove_favorites_button.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/horizontal_product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(sl(), sl(), sl(), sl(), sl()),
        ),
      ],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              final ProductCubit controller = context.read<ProductCubit>();

              return Column(
                children: [
                  getSecondAppTextfield(
                      appTextFieldInputMdel: AppTextFieldInputMdel(
                          onChangedFunction: (value) => controller.search(
                              input: controller.searchController.text),
                          textFieldLabel: "Enter_Product_Name".localization,
                          context: context,
                          controller: controller.searchController,
                          icon: CupertinoIcons.xmark)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.searchProductsList.length,
                      itemBuilder: (context, index) => HorizontalProductWidget(
                          buttonWidget: const SizedBox(),
                          bottomRightOfStackWidget: AddAndRemoveFavoritsButton(
                            controller: controller,
                            index: index,
                            productsList: state.searchProductsList,
                          ),
                          productsList: state.searchProductsList,
                          index: index),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
