part of 'product_cubit.dart';

class ProductState extends Equatable {
  //home products variables
  final List<Product> products;
  final RequestStateEnum productsState;
  final String productsMessage;
  //add And Remove Favorites variables
  final RequestStateEnum addAndRemoveFavoritesState;
  final String addAndRemoveFavoritesMessage;

  final List<Product> favoritesProducts;
  final RequestStateEnum favoritesProductsState;
  final String favoritesProductsMessage;

  const ProductState(
      {this.products = const [],
      this.productsState = RequestStateEnum.loading,
      this.productsMessage = '',
      this.addAndRemoveFavoritesState = RequestStateEnum.loading,
      this.addAndRemoveFavoritesMessage = '',
      this.favoritesProducts = const [],
      this.favoritesProductsMessage = '',
      this.favoritesProductsState = RequestStateEnum.loading});

  ProductState copywith({
    List<Product>? products,
    RequestStateEnum? productsState,
    String? productsMessage,
    RequestStateEnum? addAndRemoveFavoritesState,
    String? addAndRemoveFavoritesMessage,
    List<Product>? favoritesProducts,
    RequestStateEnum? favoritesProductsState,
    String? favoritesProductsMessage,
  }) {
    return ProductState(
        products: products ?? this.products,
        productsState: productsState ?? this.productsState,
        productsMessage: productsMessage ?? this.productsMessage,
        addAndRemoveFavoritesMessage:
            addAndRemoveFavoritesMessage ?? this.addAndRemoveFavoritesMessage,
        addAndRemoveFavoritesState:
            addAndRemoveFavoritesState ?? this.addAndRemoveFavoritesState,
        favoritesProducts: favoritesProducts ?? this.favoritesProducts,
        favoritesProductsMessage:
            favoritesProductsMessage ?? this.favoritesProductsMessage,
        favoritesProductsState:
            favoritesProductsState ?? this.favoritesProductsState);
  }

  @override
  List<Object?> get props => [
        products,
        productsState,
        productsMessage,
        addAndRemoveFavoritesState,
        addAndRemoveFavoritesMessage
      ];
}
