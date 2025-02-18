import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/add_address_button.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/shipping_addresses_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressesPage extends StatelessWidget {
  const ShippingAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddressCubit(sl(), sl())..getAddresses(),
        child: Directionality(
          textDirection: sl<BaseLocalization>().getDirectionality(),
          child: Scaffold(
              appBar: AppBar(
                  title: Text(
                "shipping_addresses".localization,
                style: TextStyles.textStyle20Bold,
              )),
              body: const ShippingAddressBodyBlocBuilder(),
              floatingActionButton: const AddAddressButton()),
        ));
  }
}
