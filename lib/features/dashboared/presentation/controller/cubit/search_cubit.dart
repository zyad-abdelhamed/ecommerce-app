import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final TextEditingController searchController = TextEditingController();

  //   List<ProductsModel> filterproducts = [];
  // void Search({required String input}) {
  //   filterproducts = products
  //       .where((element) =>
  //           element.name!.toLowerCase().startsWith(input.toLowerCase()))
  //       .toList();
  //       emit(FilterProdectsDataSuccess());
  // }
}
