import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/category.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_categories_use_case.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  CategoriesCubit(this.getCategoriesUseCase) : super(const CategoriesState());
  getCategories() async {
    Either<Failure, List<Categories>> result = await getCategoriesUseCase();
    result.fold(
        (l) => emit(CategoriesState(
            message: l.message, requestStateEnum: RequestStateEnum.failed)),
        (r) => emit(CategoriesState(
            requestStateEnum: RequestStateEnum.success, categories: r)));
  }
}
