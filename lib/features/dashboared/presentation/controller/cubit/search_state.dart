part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<Product> searchProductsList;
  final RequestStateEnum? searchState;
  const SearchState({this.searchProductsList = const [], this.searchState});

  @override
  List<Object?> get props => [searchProductsList, searchState];
}
