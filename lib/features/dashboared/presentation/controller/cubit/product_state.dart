part of 'product_cubit.dart';

 class ProductState extends Equatable {
  final List<Product> products;
  final RequestStateEnum  productsState;
  final String productsMessage;
   const ProductState({this.products =const [], this.productsState = RequestStateEnum.loading, this.productsMessage = ''});

  @override
  List<Object> get props => [products,productsState,productsMessage];
}


