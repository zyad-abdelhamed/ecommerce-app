part of 'product_cubit.dart';

class ProductState extends Equatable {
  //home products variables
  final List<Product> products;
  final RequestStateEnum productsState;
  final String productsMessage;
  //add And Remove Favorites variables
  final RequestStateEnum? addAndRemoveFavoritesState;
  final String addAndRemoveFavoritesMessage;

  const ProductState(
      {this.products = const [],
      this.productsState = RequestStateEnum.loading,
      this.productsMessage = '',
      this.addAndRemoveFavoritesState,
      this.addAndRemoveFavoritesMessage = ''});

  @override
  List<Object?> get props => [
        products,
        productsState,
        productsMessage,
        addAndRemoveFavoritesState,
        addAndRemoveFavoritesMessage
      ];
}
