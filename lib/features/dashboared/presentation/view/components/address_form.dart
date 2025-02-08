import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/core/widgets/app_sneak_bar.dart';
import 'package:ecommerce_application/core/widgets/app_textfield.dart';
import 'package:ecommerce_application/core/widgets/loading_widget.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/address_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state.addAddressesState == RequestStateEnum.failed) {
          appSneakBar(
              context: context,
              message: state.addAddressesErrorMessage,
              isError: true);
        }
      },
      builder: (context, state) {
        final AddressCubit controller = context.read<AddressCubit>();
        return Stack(
          children: [
            Form(
                child: Column(
              spacing: 20.0,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBoxs.sizedBoxH10,
                getAppTextfield(
                    appTextFieldInputMdel: AppTextFieldInputMdel(
                        textFieldLabel: 'Name',
                        context: context,
                        controller: controller.nameController)),
                getAppTextfield(
                    appTextFieldInputMdel: AppTextFieldInputMdel(
                        textFieldLabel: 'Address',
                        context: context,
                        controller: controller.addressController)),
                getAppTextfield(
                    appTextFieldInputMdel: AppTextFieldInputMdel(
                        textFieldLabel: 'city',
                        context: context,
                        controller: controller.cityController)),
                getAppTextfield(
                    appTextFieldInputMdel: AppTextFieldInputMdel(
                        textFieldLabel: 'state/province/region',
                        context: context,
                        controller: controller.regionController)),
                SizedBoxs.sizedBoxH20,
                appMaterialButton(
                    buttonFunction: () {
                      controller.addAddress(context: context);
                    },
                    buttonName: 'SAVE ADDRESS')
              ],
            )),
            Visibility(
                visible: state.addAddressesState == RequestStateEnum.loading
                    ? true
                    : false,
                child: getLoadingWidget())
          ],
        );
      },
    );
  }
}
