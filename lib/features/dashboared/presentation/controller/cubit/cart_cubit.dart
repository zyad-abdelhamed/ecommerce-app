import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_or_remove_product_from_cart.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_carts_use_case.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartsUseCase getCartsUseCase;
  final AddOrRemoveProductFromCart addOrRemoveProductFromCart;
  CartCubit(this.getCartsUseCase, this.addOrRemoveProductFromCart)
      : super(const CartState());

 static Set<String> productsInCart = {};
  
  getcarts() async {
  print("Calling getcarts...");  // تحقق من أن الدالة يتم استدعاؤها
  var result = await getCartsUseCase();
  result.fold((l) {
    print("Error: ${l.message}");  // تحقق من وجود أخطاء
    emit(CartState(message: l.message, requestStateEnum: RequestStateEnum.failed));
  }, (r) {
    print("Fetched carts: $r");  // تحقق من البيانات المسترجعة
    productsInCart = r.map((item) => item.id.toString()).toSet();
    print("Products in Cart: $productsInCart");  // تحقق من الـ Set
    emit(CartState(carts: r, requestStateEnum: RequestStateEnum.success));
  });
}

  // getcarts() async {
  //   var result = await getCartsUseCase();
  //   result.fold((l) {
  //     emit(CartState(
  //         message: l.message, requestStateEnum: RequestStateEnum.failed));
  //   }, (r) {
  //     emit(CartState(carts: r, requestStateEnum: RequestStateEnum.success));
  //      productsInCart = r.map((item) => item.id).toSet();
  //   });
  // }

  addOrRemoveProductFromCartF({required String productId}) async {
    var result = await addOrRemoveProductFromCart(parameters: productId);
    result.fold((l) {
      print('fail');
      emit(CartState(
          addOrRemoveFromCartsMessage: l.message, addOrRemoveFromCartsrequestStateEnum: RequestStateEnum.failed));
    }, (r) async {
      print('success');
      addOrRemoveIdInSetOfProductInCart(productId: productId);

      emit(const CartState(addOrRemoveFromCartsrequestStateEnum: RequestStateEnum.success));
     
    });
  }

/////////دالة productIdLoop تقوم بملئ set
  // productIdLoop({required List r}) {
  //   for (var item in r) {
  //     productsInCart.add(item);
  //   }
  // }

  addOrRemoveIdInSetOfProductInCart({required String productId}) {
    if (productsInCart.contains(productId)) {
      productsInCart.remove(productId);
    } else {
      productsInCart.add(productId);
    }
  }
}
