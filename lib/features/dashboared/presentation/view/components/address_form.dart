import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/core/widgets/app_textfield.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        final AddressCubit controller = context.read<AddressCubit>();
        return Form(
            child: Column(
          spacing: 20.0,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBoxs.sizedBoxH10,
             getAppTextfield(
                appTextFieldInputMdel: AppTextFieldInputMdel(
                    textFieldName: 'Name',
                    context: context,
                    controller: controller.addressController)),
            getAppTextfield(
                appTextFieldInputMdel: AppTextFieldInputMdel(
                    textFieldName: 'Address',
                    context: context,
                    controller: controller.addressController)),
            getAppTextfield(
                appTextFieldInputMdel: AppTextFieldInputMdel(
                    textFieldName: 'city',
                    context: context,
                    controller: controller.addressController)),
            getAppTextfield(
                appTextFieldInputMdel: AppTextFieldInputMdel(
                    textFieldName: 'state/province/region',
                    context: context,
                    controller: controller.addressController)),
           
            SizedBoxs.sizedBoxH20,
            appMaterialButton(buttonFunction: () {}, buttonName: 'SAVE ADDRESS')
          ],
        ));
      },
    );
  }
}
