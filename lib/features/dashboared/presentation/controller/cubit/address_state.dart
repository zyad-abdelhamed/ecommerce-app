part of 'address_cubit.dart';

class AddressState extends Equatable {
  final List<AddressEntity> addresses;
  final RequestStateEnum getAddressesState;
  final String getAddressesErrorMessage;
  const AddressState(
      {this.addresses = const [],
      this.getAddressesState = RequestStateEnum.loading,
      this.getAddressesErrorMessage = ''});

  @override
  List<Object> get props =>
      [addresses, getAddressesState, getAddressesErrorMessage];
}
