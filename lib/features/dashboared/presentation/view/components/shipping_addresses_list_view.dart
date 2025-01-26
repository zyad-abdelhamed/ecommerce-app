import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/address_container.dart';
import 'package:flutter/material.dart';

class AddressesListView extends StatelessWidget {
  const AddressesListView({
    super.key,
    required this.controller,
    required this.state,
  });

  final AddressCubit controller;
  final AddressState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              state: state,
              controller: controller,
              index: index,
            ),
          );
        });
  }
}
