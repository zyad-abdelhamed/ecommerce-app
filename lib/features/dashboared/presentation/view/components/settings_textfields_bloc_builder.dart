import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/core/widgets/app_textfield.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';

import 'package:ecommerce_application/features/dashboared/presentation/view/components/settings_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SettingsTextFieldsBlocBuilder extends StatelessWidget {
  const SettingsTextFieldsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Column(
          spacing: 20.0,
          children: [
            getAppTextfield(
                appTextFieldInputMdel: AppTextFieldInputMdel(
              textFieldLabel: state.userData.name,
              context: context,
              readOnly: true,
            )),
            getAppTextfield(
                appTextFieldInputMdel: AppTextFieldInputMdel(
              textFieldLabel: state.userData.email,
              context: context,
              readOnly: true,
            )),
            getAppTextfield(
                appTextFieldInputMdel: AppTextFieldInputMdel(
              textFieldLabel: state.userData.phone,
              context: context,
              readOnly: true,
            )),
            SizedBoxs.sizedBoxH20,
             SettingsRow(
              startString: "password".localization,
              textStyle: TextStyles.textStyle18grey,
              textButtonText: "change".localization,
            ),
            getAppTextfield(
                appTextFieldInputMdel: AppTextFieldInputMdel(
              textFieldLabel: '*************',
              context: context,
              readOnly: true,
            )),
          ],
        );
      },
    );
  }
}
