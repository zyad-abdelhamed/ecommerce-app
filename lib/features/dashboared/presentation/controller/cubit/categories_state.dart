part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  final String message;
  final List<Categories> categories;
  final RequestStateEnum requestStateEnum;
  const CategoriesState(
      {this.categories = const [],
      this.message = '',
      this.requestStateEnum = RequestStateEnum.loading});

  @override
  List<Object> get props => [message, categories, requestStateEnum];
}
