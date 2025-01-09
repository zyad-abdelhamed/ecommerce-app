import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_and_remove_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_products_use_case.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/cart_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final AddAndRemoveFavoritesUseCase addAndRemoveFavoritesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  static Set<String> favoritesProductsId = {};

  ProductCubit(this.getProductsUseCase, this.addAndRemoveFavoritesUseCase, this.getFavoritesUseCase)
      : super(const ProductState());

  getHomeProducts() async {
    Either<Failure, List<Product>> result = await getProductsUseCase(parameters: 0);
    result.fold(
      (failure) => emit(state.copywith(
          productsState: RequestStateEnum.failed,
          productsMessage: failure.message)),
      (products) => emit(state.copywith(
          products: products, productsState: RequestStateEnum.success)),
    );
  }

  addAndRemoveFavorites({required String productId}) async {
    Either<Failure, Unit> result =
        await addAndRemoveFavoritesUseCase(parameters: productId);
    result.fold(
        (failed) => emit(state.copywith(
            addAndRemoveFavoritesState: RequestStateEnum.failed,
            addAndRemoveFavoritesMessage: failed.message)), (success) async{
            //  await getFavorites();
              d(productId: productId);
               dsl
          .get<FavoriteIconController>()
          .changeFavoritesIconWithAnimation(productId: productId);
          
      emit( state.copywith(
addAndRemoveFavoritesState: RequestStateEnum.success      ));    });
  }
   getFavorites()async{
    Either<Failure, List<Product>> result = await getFavoritesUseCase() ;
    result.fold(
      (failure) => emit(state.copywith(
          favoritesProductsState: RequestStateEnum.failed,
          favoritesProductsMessage: failure.message)),
      (products) { 
         for (var item in products) {
        favoritesProductsId.add(item.id.toString());
       }
        emit(state.copywith(
         favoritesProducts: products, favoritesProductsState: RequestStateEnum.success));
    } );
   }
  d({required String productId}){
    if(favoritesProductsId.contains(productId)){
      favoritesProductsId.remove(productId);
    }else{
      favoritesProductsId.add(productId);
    }
  }
}
