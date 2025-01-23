import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/helper_functions/get_app_empty_list_widget.dart';
import 'package:ecommerce_application/core/helper_functions/get_app_failure_widget.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/widgets/loading_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/address_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressListView extends StatelessWidget {
  const ShippingAddressListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
      print(state);
      switch (state.getAddressesState) {
        case RequestStateEnum.success:
          return state.addresses.isEmpty
              ? getAppEmptyListWidget(message: 'No Addresses')
              : ListView.builder(
                  itemCount: state.addresses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        boxShadow: ViewConstants.appShadow,
                        color: AppColors.whiteDesignColor,
                      ),
                      child: AddressContainer(
                        addressEntity: state.addresses,
                        index: index,
                      ),
                    );
                  });
        case RequestStateEnum.failed:
          return getAppFailureWidget(message: state.getAddressesErrorMessage);
        case RequestStateEnum.loading:
          return getLoadingWidget();
      }
    });
  }
}
