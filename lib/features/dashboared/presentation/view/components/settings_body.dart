import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/widgets/app_textfield.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/app_material_button.dart';
import '../../../../../core/widgets/app_sneak_bar.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/usecases/change_password_use_case.dart';

// ignore: must_be_immutable
class SettingsBody extends StatelessWidget {
  SettingsBody({super.key});
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  GlobalKey<FormState> passwordChangeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            ViewConstants.settings,
            style: TextStyles.textStyle34,
          ),
          SizedBoxs.sizedBoxH10,
          const Text(
            ViewConstants.personalInfo,
            style: TextStyles.textStyle18black,
          ),
          SizedBoxs.sizedBoxH10,
          const TextField(),
          SizedBoxs.sizedBoxH10,
          const TextField(),
          SizedBoxs.sizedBoxH30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                ViewConstants.password,
                style: TextStyles.textStyle18black,
              ),
              TextButton(
                  onPressed: () {
                    showChangePasswordBottomSheet(
                      context: context,
                      passwordChangeKey: passwordChangeKey,
                      oldPasswordController: oldPasswordController,
                      newPasswordController: newPasswordController,
                      repeatPasswordController: repeatPasswordController,
                    );
                  },
                  child: const Text(
                    ViewConstants.change,
                    style: TextStyles.textStyle18grey,
                  ))
            ],
          ),
          const TextField()
        ],
      ),
    );
  }
}

///////////

void showChangePasswordBottomSheet({
  required BuildContext context,
  required GlobalKey<FormState> passwordChangeKey,
  required TextEditingController oldPasswordController,
  required TextEditingController newPasswordController,
  required TextEditingController repeatPasswordController,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) {
      return BlocProvider(
        create: (context) => UserCubit(dsl(), dsl(), dsl()),
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state)async {
            print(state);
            print( state.changePasswordMessage);
             if (state.changePasswordState == RequestStateEnum.success) {
              Navigator.pop(context);
            appSneakBar(

                context: context, message: 'password changed successfully', isError: false);
           
          } else if (state.changePasswordState == RequestStateEnum.failed) {
                          Navigator.pop(context);

           appSneakBar(
      context: context, 
      message: state.changePasswordMessage.isNotEmpty 
          ? state.changePasswordMessage 
          : 'Failed to change password', 
      isError: true,
    );
          }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBoxs.sizedBoxH10,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ViewConstants.password,
                        style: TextStyles.textStyle18black,
                      ),
                      Text(
                        ViewConstants.change,
                        style: TextStyles.textStyle18black,
                      ),
                    ],
                  ),
                  SizedBoxs.sizedBoxH20,
                  Form(
                    key: passwordChangeKey,
                    child: Column(
                      children: [
                        getAppTextfield(
                          appTextFieldInputMdel: AppTextFieldInputMdel(
                            obscure: true,
                            textFieldName: 'Old Password',
                            context: context,
                            controller: oldPasswordController,
                          ),
                        ),
                        SizedBoxs.sizedBoxH20,
                        getAppTextfield(
                          appTextFieldInputMdel: AppTextFieldInputMdel(
                            obscure: true,
                            textFieldName: 'New Password',
                            context: context,
                            controller: newPasswordController,
                          ),
                        ),
                        SizedBoxs.sizedBoxH20,
                        getAppTextfieldWithVaildator(
                          obscure: true,
                          function: (value) {
                            if (repeatPasswordController.text.isEmpty) {
                              return 'this field must not be empty';
                            } else if (repeatPasswordController.text !=
                                newPasswordController.text) {
                              return 'not equal with new password';
                            } else {
                              return null;
                            }
                          },
                          textFieldName: 'Repeat Password',
                          context: context,
                          controller: repeatPasswordController,
                        ),
                        SizedBoxs.sizedBoxH20,
                        appMaterialButton(
                          buttonFunction: () {
                            if (passwordChangeKey.currentState!.validate()) {
                              final cubit = context.read<UserCubit>();
                              cubit.changePassword(
                                parameters: ChangePasswordParameters(
                                  currentPassword: oldPasswordController.text,
                                  newPassword: repeatPasswordController.text,
                                ),
                              );
                            }
                          },
                          buttonName: state.changePasswordState ==
                                  RequestStateEnum.loading
                              ? 'LOADING...'
                              : 'SAVE PASSWORD',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
