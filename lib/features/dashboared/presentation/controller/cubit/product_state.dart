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
  final ChangeProductsDisplayStateEnum? productsDisplayState;
  //cart
  final String cartProductsMessage;
  final RequestStateEnum cartProductsState;
  final List<Product> cartProducts;
  final String addOrRemoveFromCartsMessage;
  final RequestStateEnum? addOrRemoveFromCartsrequestStateEnum;

  const ProductState(
      {this.products = const [],
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
      //cart
      this.addOrRemoveFromCartsMessage = '',
      this.addOrRemoveFromCartsrequestStateEnum,
      this.cartProducts = const [],
      this.cartProductsMessage = '',
      this.cartProductsState = RequestStateEnum.loading});

  ProductState copywith(
      {List<Product>? products,
      RequestStateEnum? productsState,
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
      ChangeProductsDisplayStateEnum? productsDisplayState}) {
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
        productsDisplayState: productsDisplayState ?? this.productsDisplayState);
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
        productsDisplayState
      ];
}

// class C extends ProductState{
//   @override
//   List<Object?> get props => [];
// }
