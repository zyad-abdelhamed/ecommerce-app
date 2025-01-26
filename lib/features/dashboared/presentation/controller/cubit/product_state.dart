part of 'product_cubit.dart';

class ProductState extends Equatable {
  //home products
  final List<Product> products;
  final List<Product> searchProductsList;
  final RequestStateEnum? searchState;
  final RequestStateEnum productsState;
  final String productsMessage;
  //add And Remove Favorites
  final RequestStateEnum addAndRemoveFavoritesState;
  final String addAndRemoveFavoritesMessage;
  //favorites
  final List<Product> favoritesProducts;
  final RequestStateEnum favoritesProductsState;
  final String favoritesProductsMessage;
  //products display
  final ChangeProductsDisplayStateEnum? productsDisplayState;
  final int crossAxisCount;
  final Icon displayProductsIcon;
  //cart
  final String cartProductsMessage;
  final RequestStateEnum cartProductsState;
  final List<Product> cartProducts;
  //add and remove cart
  final String addOrRemoveFromCartsMessage;
  final RequestStateEnum? addOrRemoveFromCartsrequestStateEnum;

  const ProductState(
      {
      //home products
      this.searchState,
      this.searchProductsList = const [],
      this.products = const [],
      this.productsState = RequestStateEnum.loading,
      this.productsMessage = '',
      this.productsDisplayState,
      //add and remove favorites
      this.addAndRemoveFavoritesState = RequestStateEnum.loading,
      this.addAndRemoveFavoritesMessage = '',
      //favorites
      this.favoritesProducts = const [],
      this.favoritesProductsMessage = '',
      this.favoritesProductsState = RequestStateEnum.loading,
      //add and remove cart
      this.addOrRemoveFromCartsMessage = '',
      this.addOrRemoveFromCartsrequestStateEnum,
      //cart
      this.cartProducts = const [],
      this.cartProductsMessage = '',
      this.cartProductsState = RequestStateEnum.loading,
      //products display
      this.crossAxisCount = 1,
      this.displayProductsIcon = const Icon(Icons.grid_3x3)});

  ProductState copywith(
      {List<Product>? products,
      RequestStateEnum? productsState,
      List<Product>? searchProductsList,
      RequestStateEnum? searchState,
      String? productsMessage,
      RequestStateEnum? addAndRemoveFavoritesState,
      String? addAndRemoveFavoritesMessage,
      List<Product>? favoritesProducts,
      RequestStateEnum? favoritesProductsState,
      String? favoritesProductsMessage,
      String? cartProductsMessage,
      RequestStateEnum? cartProductsState,
      List<Product>? cartProducts,
      String? addOrRemoveFromCartsMessage,
      RequestStateEnum? addOrRemoveFromCartsrequestStateEnum,
      ChangeProductsDisplayStateEnum? productsDisplayState,
      int? crossAxisCount,
      Icon? displayProductsIcon}) {
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
            favoritesProductsState ?? this.favoritesProductsState,
        addOrRemoveFromCartsMessage:
            addOrRemoveFromCartsMessage ?? this.addOrRemoveFromCartsMessage,
        addOrRemoveFromCartsrequestStateEnum:
            addOrRemoveFromCartsrequestStateEnum ??
                this.addOrRemoveFromCartsrequestStateEnum,
        cartProducts: cartProducts ?? this.cartProducts,
        cartProductsMessage: cartProductsMessage ?? this.cartProductsMessage,
        cartProductsState: cartProductsState ?? this.cartProductsState,
        productsDisplayState: productsDisplayState ?? this.productsDisplayState,
        crossAxisCount: crossAxisCount ?? this.crossAxisCount,
        displayProductsIcon: displayProductsIcon ?? this.displayProductsIcon,
        searchProductsList: searchProductsList ?? this.searchProductsList,
        searchState: searchState ?? this.searchState);
  }

  @override
  List<Object?> get props => [
        products,
        productsState,
        productsMessage,
        addAndRemoveFavoritesState,
        addAndRemoveFavoritesMessage,
        favoritesProducts,
        favoritesProductsMessage,
        favoritesProductsState,
        cartProducts,
        cartProductsMessage,
        cartProductsState,
        addOrRemoveFromCartsMessage,
        addOrRemoveFromCartsrequestStateEnum,
        productsDisplayState,
        crossAxisCount,
        displayProductsIcon,
        searchProductsList,
        searchState
      ];
}
