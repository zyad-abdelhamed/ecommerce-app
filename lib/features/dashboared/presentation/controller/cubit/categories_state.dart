part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  final String message;
  final List<Categories> categories;
  final RequestStateEnum requestStateEnum;
  final RequestStateEnum categoryProductsState;
  final String categoryProductsMessage;
  final List<Product> categoryProducts;
  const CategoriesState(
      {this.categoryProductsState = RequestStateEnum.loading,
      this.categoryProducts = const [],
      this.categoryProductsMessage = '',
      this.categories = const [],
      this.message = '',
      this.requestStateEnum = RequestStateEnum.loading});

  @override
  List<Object> get props => [
        message,
        categories,
        requestStateEnum,
        categoryProductsState,
        categoryProductsMessage
      ];
}
