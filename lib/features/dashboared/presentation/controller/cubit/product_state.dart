part of 'product_cubit.dart';

class ProductState extends Equatable {
  //home products variables
  final List<Product> products;
  final RequestStateEnum productsState;
  final String productsMessage;
  //add And Remove Favorites variables
  final RequestStateEnum? addAndRemoveFavoritesState;
  final String addAndRemoveFavoritesMessage;

   final List<Product> favoritesProducts;
  final RequestStateEnum favoritesProductsState;
  final String favoritesProductsMessage;

  const ProductState(
      {this.products = const [],
      this.productsState = RequestStateEnum.loading,
      this.productsMessage = '',
      this.addAndRemoveFavoritesState,
      this.addAndRemoveFavoritesMessage = '',this.favoritesProducts = const [],this.favoritesProductsMessage = '',this.favoritesProductsState =RequestStateEnum.loading});

  @override
  List<Object?> get props => [
        products,
        productsState,
        productsMessage,
        addAndRemoveFavoritesState,
        addAndRemoveFavoritesMessage
      ];
}
