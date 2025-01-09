import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_carts_use_case.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartsUseCase getCartsUseCase;
  CartCubit(this.getCartsUseCase) : super(const CartState());
  getcarts() async {
    var result = await getCartsUseCase();
    result.fold(
        (l) => emit(CartState(
            message: l.message, requestStateEnum: RequestStateEnum.failed)),
        (r) => emit(
            CartState(carts: r, requestStateEnum: RequestStateEnum.success)));
  }
}
