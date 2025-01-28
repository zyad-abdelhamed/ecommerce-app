import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/address.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_address_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_address_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddAddressUseCase addAddressUseCase;
  final GetAddressUseCase getAddressUseCase;
  AddressCubit(this.addAddressUseCase, this.getAddressUseCase)
      : super(const AddressState());
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void getAddresses() async {
    Either<Failure, List<AddressEntity>> result = await getAddressUseCase();
    result.fold(
        (failure) => emit(state.copyWith(
            getAddressesState: RequestStateEnum.failed,
            getAddressesErrorMessage: failure.message)), (addresses) {
      emit(AddressState(
          getAddressesState: RequestStateEnum.success, addresses: addresses));
    });
  }

  void addAddress({required BuildContext context}) async {
    emit(const AddressState(addAddressesState: RequestStateEnum.loading));
    Either<Failure, Unit> result = await addAddressUseCase(
        parameters: AddAddressParameters(
            name: nameController.text,
            city: cityController.text,
            region: regionController.text,
            details: addressController.text));
    result.fold(
        (failure) => emit(AddressState(
            addAddressesState: RequestStateEnum.failed,
            addAddressesErrorMessage: failure.message)),
        (success) => context.pushReplacement('/ShippingAddressesPage'));
  }

  //change selected checkbox
  int selectedCheckBox =
      sl<CacheProxy>().getIntFromCache(key: CacheConstants.selectedAddressKey) ?? 0;

  void changeSelectedCheckBox({required int index}) {
    selectedCheckBox = index;
    emit(state.copyWith(
        selectedCheckBox: index,
        changeSelectedCheckBoxStateEnum:
            ChangeSelectedCheckBoxStateEnum.changeSelectedCheckBoxDone));
    sl<CacheProxy>().insertIntToCache(
        key: CacheConstants.selectedAddressKey, value: index);
  }

  AddressEntity get getSelectedAddress => state.addresses[selectedCheckBox];
}
