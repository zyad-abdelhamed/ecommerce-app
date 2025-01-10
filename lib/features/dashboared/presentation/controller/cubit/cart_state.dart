part of 'cart_cubit.dart';

class CartState extends Equatable {
  final String message;
  final RequestStateEnum requestStateEnum;
  final List<Product> carts;
  final String addOrRemoveFromCartsMessage;
  final RequestStateEnum? addOrRemoveFromCartsrequestStateEnum;
  const CartState(
      {this.addOrRemoveFromCartsMessage = '',
      this.addOrRemoveFromCartsrequestStateEnum,
      this.carts = const [],
      this.message = '',
      this.requestStateEnum = RequestStateEnum.loading});

  
      

  @override
  List<Object> get props => [message, carts, requestStateEnum];
}
