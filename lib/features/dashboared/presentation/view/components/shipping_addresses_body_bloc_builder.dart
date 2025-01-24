import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/widgets/get_app_empty_list_widget.dart';
import 'package:ecommerce_application/core/widgets/get_app_failure_widget.dart';
import 'package:ecommerce_application/core/widgets/loading_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/shipping_addresses_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressBodyBlocBuilder extends StatelessWidget {
  const ShippingAddressBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
              final AddressCubit controller = context.read<AddressCubit>();
      switch (state.getAddressesState) {
        case RequestStateEnum.success:
          return state.addresses.isEmpty
              ? getAppEmptyListWidget(message: 'No Addresses')
              : AddressesListView(controller: controller,state: state,);
        case RequestStateEnum.failed:
          return getAppFailureWidget(message: state.getAddressesErrorMessage);
        case RequestStateEnum.loading:
          return getLoadingWidget();
      }
    });
  }
}