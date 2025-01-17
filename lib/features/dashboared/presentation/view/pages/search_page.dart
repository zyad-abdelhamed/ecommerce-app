import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/search_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [SearchTextFieldBlocBuilder()],
          ),
        ),
      ),
    );
  }
}
