import 'package:ecommerce_application/core/services/dependancy_injection/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/add_address_button.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/shipping_addresses_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressesPage extends StatelessWidget {
  const ShippingAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddressCubit(dsl(), dsl())..getAddresses(),
        child: Scaffold(
            appBar: AppBar(
                title: Text(
              'Shipping Addresses',
              style: TextStyles.textStyle20Bold,
            )),
            body: const ShippingAddressListView(),
            floatingActionButton: const AddAddressButton()));
  }
}
