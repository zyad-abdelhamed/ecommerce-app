import 'package:ecommerce_application/core/services/dependancy_injection/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/address_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddShippingAddressPage extends StatelessWidget {
  const AddShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(dsl(),dsl()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Adding Shipping Address',
            style: TextStyles.textStyle20Bold,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: AddressForm(),
        ),
      ),
    );
  }
}

