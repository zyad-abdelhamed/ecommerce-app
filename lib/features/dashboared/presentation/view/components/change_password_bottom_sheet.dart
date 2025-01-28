import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/core/widgets/app_textfield.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/change_password_use_case.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import 'package:flutter/material.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({
    super.key,
    required this.controller,
    required this.buttonname,
  });
  final UserCubit controller;
  final String buttonname;
  @override
  Widget build(BuildContext context) {
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
            key: controller.passwordChangeKey,
            child: Column(
              children: [
                getAppTextfield(
                  appTextFieldInputMdel: AppTextFieldInputMdel(
                    obscure: true,
                    textFieldName: 'Old Password',
                    context: context,
                    controller: controller.oldPasswordController,
                  ),
                ),
                SizedBoxs.sizedBoxH20,
                getAppTextfield(
                  appTextFieldInputMdel: AppTextFieldInputMdel(
                    obscure: true,
                    textFieldName: 'New Password',
                    context: context,
                    controller: controller.newPasswordController,
                  ),
                ),
                SizedBoxs.sizedBoxH20,
                getAppTextfieldWithVaildator(
                  obscure: true,
                  function: (value) {
                    if (controller.repeatPasswordController.text.isEmpty) {
                      return 'this field must not be empty';
                    } else if (controller.repeatPasswordController.text !=
                        controller.newPasswordController.text) {
                      return 'not equal with new password';
                    } else {
                      return null;
                    }
                  },
                  textFieldName: 'Repeat Password',
                  context: context,
                  controller: controller.repeatPasswordController,
                ),
                SizedBoxs.sizedBoxH20,
                appMaterialButton(
                    buttonFunction: () {
                      if (controller.passwordChangeKey.currentState!
                          .validate()) {
                        controller.changePassword(
                          parameters: ChangePasswordParameters(
                            currentPassword:
                                controller.oldPasswordController.text,
                            newPassword:
                                controller.repeatPasswordController.text,
                          ),
                        );
                      }
                    },
                    buttonName: buttonname)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
