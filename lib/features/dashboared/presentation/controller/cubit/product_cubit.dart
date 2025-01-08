import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_and_remove_favorites_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_products_use_case.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/favorite_icon_controller.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final AddAndRemoveFavoritesUseCase addAndRemoveFavoritesUseCase;
  static Set<String> favoritesProductsId = {};

  ProductCubit(this.getProductsUseCase, this.addAndRemoveFavoritesUseCase)
      : super(const ProductState());

  getHomeProducts() async {
    Either<Failure, List<Product>> result = await getProductsUseCase(parameters: 44);
    result.fold(
      (failure) => emit(ProductState(
          productsState: RequestStateEnum.failed,
          productsMessage: failure.message)),
      (products) => emit(ProductState(
          products: products, productsState: RequestStateEnum.success)),
    );
  }

  addAndRemoveFavorites({required String productId}) async {
    Either<Failure, Unit> result =
        await addAndRemoveFavoritesUseCase(parameters: productId);
    result.fold(
        (failed) => emit(ProductState(
            addAndRemoveFavoritesState: RequestStateEnum.failed,
            addAndRemoveFavoritesMessage: failed.message)), (success) async{
      emit(const ProductState(
        addAndRemoveFavoritesState: RequestStateEnum.success,
      ));
      dsl
          .get<FavoriteIconCubit>()
          .changeFavoritesIconWithAnimation(productId: productId);
        await  getHomeProducts();
    });
  }
}
