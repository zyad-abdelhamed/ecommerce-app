import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/text_styles.dart';

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
            style: TextStyles.textStyle25b,
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
                style: TextStyles.textStyle25b,
              ),
              TextButton(
                  onPressed: () {
                    customBottomSheet(
                        context: context,
                        passwordChangeKey: passwordChangeKey,
                        oldPasswordController: oldPasswordController,
                        newPasswordController: newPasswordController,
                        repeatPasswordController: repeatPasswordController);
                  },
                  child: const Text(
                    ViewConstants.change,
                    style: TextStyles.textStyle25g,
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

Future customBottomSheet({
  required BuildContext context,
  required GlobalKey<FormState> passwordChangeKey,
  required TextEditingController oldPasswordController,
  required TextEditingController newPasswordController,
  required TextEditingController repeatPasswordController,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) {
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
                  style: TextStyles.textStyle25b,
                ),
                Text(
                  ViewConstants.change,
                  style: TextStyles.textStyle25b,
                )
              ],
            ),
            SizedBoxs.sizedBoxH20,
            Form(
                key: passwordChangeKey,
                child: Column(
                  children: [
                    getAppTextfield(
                        textFieldName: 'Old Password',
                        context: context,
                        controller: oldPasswordController),
                          SizedBoxs.sizedBoxH20,
            getAppTextfield(
                textFieldName: 'New Password',
                context: context,
                controller: newPasswordController),
            SizedBoxs.sizedBoxH20,
            getAppTextfieldWithVaildator(
                function: (value) {
                  if (repeatPasswordController.text.isEmpty) {
                    return 'this field must not be empty';
                  } else if (repeatPasswordController.text !=
                      newPasswordController.text) {
                    return 'not equel with new password';
                  } else {
                    return null;
                  }
                },
                textFieldName: 'Repeat Password',
                context: context,
                controller: repeatPasswordController),
                  ],
                )),
          
            SizedBoxs.sizedBoxH20,
            appMaterialButton(
                buttonFunction: () {
                  if(passwordChangeKey.currentState!.validate()){

                  }
                }, buttonName: 'SAVE PASSWORD')
          ],
        ),
      );
    },
  );
}
