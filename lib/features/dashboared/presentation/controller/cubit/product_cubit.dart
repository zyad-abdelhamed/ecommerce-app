import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_and_remove_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_or_remove_product_from_cart.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_carts_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_products_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  //use cases
  final GetProductsUseCase getProductsUseCase;
  final AddAndRemoveFavoritesUseCase addAndRemoveFavoritesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final GetCartsUseCase getCartsUseCase;
  final AddOrRemoveProductFromCart addOrRemoveProductFromCart;
//constructor
  ProductCubit(
      this.getProductsUseCase,
      this.addAndRemoveFavoritesUseCase,
      this.getFavoritesUseCase,
      this.getCartsUseCase,
      this.addOrRemoveProductFromCart)
      : super(const ProductState());
  //get home products data(home products, products in favurites, products in cart)
  void getHomeProductsData() async {
    await getFavorites();
    await getcarts();
    getProducts(categoryId: 0);
  }

///////////////////////////////////////////////////////////
  //get products
  int crossAxisCount = 1;
  double? getMainAxisExtent({required BuildContext context}){
     if(crossAxisCount==1){
    return context.height * .45;
    }else{
     return context.height * 1 / 6 + 20;
    }
  }
 void changeProductsDisplay(){
    if(crossAxisCount==1){
      crossAxisCount = 2;
      emit(state.copywith(productsDisplayState: ChangeProductsDisplayStateEnum.vertical));
    }else{
      crossAxisCount = 1;
      emit(state.copywith(productsDisplayState: ChangeProductsDisplayStateEnum.horizontal));
    }

  }
  void getProducts({required int categoryId, String? categoryName}) async {
    Either<Failure, List<Product>> result =
        await getProductsUseCase(parameters: categoryId);
    result.fold(
        (failure) => emit(state.copywith(
            productsState: RequestStateEnum.failed,
            productsMessage: failure.message)), (products) {
      emit(state.copywith(
          productsState: RequestStateEnum.success, products: products));
    });
  }

////////////////////////////////////////////////////////
//favorites
  static Set<String> favoritesProductsId = {};
  void addAndRemoveFavorites({required String productId}) async {
    Either<Failure, Unit> result =
        await addAndRemoveFavoritesUseCase(parameters: productId);
    result.fold(
        (failed) => emit(state.copywith(
            addAndRemoveFavoritesState: RequestStateEnum.failed,
            addAndRemoveFavoritesMessage: failed.message)), (success) async {
      if (favoritesProductsId.contains(productId)) {
        favoritesProductsId.remove(productId);
      } else {
        favoritesProductsId.add(productId);
      }
      await getFavorites();
      emit(
          state.copywith(addAndRemoveFavoritesState: RequestStateEnum.success));
    });
  }

  Future<void> getFavorites() async {
    // state.favoritesProducts.clear();
    Either<Failure, List<Product>> result = await getFavoritesUseCase();
    result.fold(
        (failure) => emit(state.copywith(
            favoritesProductsState: RequestStateEnum.failed,
            favoritesProductsMessage: failure.message)), (products) {
      favoritesProductsId = products.map((item) => item.id.toString()).toSet();
      emit(state.copywith(
          favoritesProducts: products,
          favoritesProductsState: RequestStateEnum.success));
    });
  }

  ////////////////////////////////////////////////////////////
  //cart
  Set<String> productsInCart = {};

  getcarts() async {
    var result = await getCartsUseCase();
    result.fold((l) {
      emit(state.copywith(
          cartProductsMessage: l.message,
          cartProductsState: RequestStateEnum.failed));
    }, (r) {
      productsInCart = r.map((item) => item.id.toString()).toSet();
      emit(state.copywith(
          cartProducts: r, cartProductsState: RequestStateEnum.success));
    });
  }

  addOrRemoveCartProducts({required String productId}) async {
    Either<Failure, Unit> result =
        await addOrRemoveProductFromCart(parameters: productId);
    result.fold((l) {
      emit(state.copywith(
          addOrRemoveFromCartsMessage: l.message,
          addOrRemoveFromCartsrequestStateEnum: RequestStateEnum.failed));
    }, (r) async {
      if (productsInCart.contains(productId)) {
        productsInCart.remove(productId);
      } else {
        productsInCart.add(productId);
      }
      await getcarts();
      emit(state.copywith(
          addOrRemoveFromCartsrequestStateEnum: RequestStateEnum.success));
    });
  }

  String getCartButtonName({required int index}) {
    if (productsInCart.contains(state.products[index].id.toString())) {
      return 'remove from cart';
    }
    return 'add to cart';
  }
}
