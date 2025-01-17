import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:ecommerce_application/core/utils/second_app_text_field.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextFieldBlocBuilder extends StatelessWidget {
  const SearchTextFieldBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final SearchCubit controller = context.read<SearchCubit>();
        return getSecondAppTextfield(
            appTextFieldInputMdel: AppTextFieldInputMdel(
                textFieldName: ' Enter Product Name',
                context: context,
                controller: controller.searchController,
                suffixIcon: CupertinoIcons.xmark
                ));
      },
    );
  }
}
