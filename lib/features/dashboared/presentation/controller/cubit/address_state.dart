part of 'address_cubit.dart';

class AddressState extends Equatable {
  final List<AddressEntity> addresses;
  final RequestStateEnum getAddressesState;
  final String getAddressesErrorMessage;
  final RequestStateEnum? addAddressesState;
  final String addAddressesErrorMessage;
  final int selectedCheckBox;
  final ChangeSelectedCheckBoxStateEnum? changeSelectedCheckBoxStateEnum;
  const AddressState(
      {this.addresses = const [],
      this.getAddressesState = RequestStateEnum.loading,
      this.getAddressesErrorMessage = '',
      this.addAddressesErrorMessage = '',
      this.addAddressesState,
      this.selectedCheckBox = 0,
      this.changeSelectedCheckBoxStateEnum});

  AddressState copyWith(
      {List<AddressEntity>? addresses,
      RequestStateEnum? getAddressesState,
      String? getAddressesErrorMessage,
      RequestStateEnum? addAddressesState,
      String? addAddressesErrorMessage,
      int? selectedCheckBox,
      ChangeSelectedCheckBoxStateEnum? changeSelectedCheckBoxStateEnum}) {
    return AddressState(
        addresses: addresses ?? this.addresses,
        getAddressesState: getAddressesState ?? this.getAddressesState,
        getAddressesErrorMessage:
            getAddressesErrorMessage ?? this.getAddressesErrorMessage,
        addAddressesState: addAddressesState ?? this.addAddressesState,
        addAddressesErrorMessage:
            addAddressesErrorMessage ?? this.addAddressesErrorMessage,
        selectedCheckBox: selectedCheckBox ?? this.selectedCheckBox,
        changeSelectedCheckBoxStateEnum: changeSelectedCheckBoxStateEnum ??
            this.changeSelectedCheckBoxStateEnum);
  }

  @override
  List<Object?> get props => [
        addresses,
        getAddressesState,
        getAddressesErrorMessage,
        addAddressesErrorMessage,
        addAddressesState,
        selectedCheckBox,
        changeSelectedCheckBoxStateEnum
      ];
}
