import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/product_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ProductCubit productState;
  SearchCubit(this.productState) : super(const SearchState());
  final TextEditingController searchController = TextEditingController();

  void search({required String input}) {
    // emit(SearchState(
    //     searchProductsList: productState.productss
    //         .where((element) =>
    //             element.name.toLowerCase().startsWith(input.toLowerCase()))
    //         .toList(),
    //     searchState: RequestStateEnum.success));
  }
}
