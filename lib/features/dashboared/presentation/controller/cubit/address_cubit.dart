import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/address.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_address_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_address_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddAddressUseCase addAddressUseCase;
  final GetAddressUseCase getAddressUseCase;
  AddressCubit(this.addAddressUseCase, this.getAddressUseCase)
      : super(const AddressState());
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void getAddresses() async {
     Either<Failure, List<AddressEntity>> result =
        await getAddressUseCase();
    result.fold(
      (failure) => emit(AddressState(
          getAddressesState: RequestStateEnum.failed,
          getAddressesErrorMessage: failure.message)),
      (addresses) => emit(AddressState(
          getAddressesState: RequestStateEnum.success, addresses: addresses)),
    );
  }
}
