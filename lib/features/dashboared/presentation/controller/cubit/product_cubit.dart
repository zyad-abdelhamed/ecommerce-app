import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_products_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.getProductsUseCase) : super(const ProductState());
  final GetProductsUseCase getProductsUseCase;
  getProducts() async {
    Either<Failure, List<Product>> result = await getProductsUseCase();
    result.fold(
      (failure) => emit(ProductState(
          productsState: RequestStateEnum.failed,
          productsMessage: failure.message)),
      (products) => emit(ProductState(
          products: products, productsState: RequestStateEnum.success)),
    );
  }

  //add animation to favorite icon
  double scale = 1.0;
  Icon favoriteIcon = const Icon(
    Icons.favorite_outline,
    color: Colors.grey,
  );
  void changeFavoriteIconWithAnimation() {
    scale = 1.5;
    favoriteIcon = const Icon(
      Icons.favorite,
      color: Colors.red,
    );
    emit(const ProductState());

    // scale = 1.0;
    // favoriteIcon = const Icon(
    //   Icons.favorite_outline,
    //   color: Colors.grey,
    // );
    // emit(const ProductState());
  }
}
