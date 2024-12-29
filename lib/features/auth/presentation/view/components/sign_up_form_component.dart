
import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_sneak_bar.dart';
import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/loading_widget.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormComponent extends StatelessWidget {
  const SignUpFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state.signUpState == AuthRequestStateEnum.success) {
        getLoadingWidget;
      } else if (state.signUpState == AuthRequestStateEnum.failed) {
        getLoadingWidget;
        appSneakBar(context: context, message: state.message);
      }
    }, builder: (context, state) {
      final controller = context.read<AuthCubit>();
      print('///////////////////////////////////');
      print(state);
      return Form(
          key: controller.formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getAppTextfield(
                  textFieldName: 'username',
                  controller: controller.usernameController,
                  context: context),
              SizedBoxs.sizedBoxH10,
              getAppTextfield(
                  textFieldName: 'phonenumber',
                  controller: controller.phoneNumerController,
                  context: context),
              SizedBoxs.sizedBoxH10,
              getAppTextfield(
                  textFieldName: 'email',
                  controller: controller.emailController,
                  context: context),
              SizedBoxs.sizedBoxH10,
              getAppTextfield(
                  textFieldName: 'password',
                  controller: controller.passwordController,
                  context: context),
              SizedBoxs.sizedBoxH20,
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(ViewConstants.alreadyHaveANAccount),
                  Icon(Icons.arrow_right_alt)
                ],
              ),
              SizedBoxs.sizedBoxH30,
              appMaterialButton(
                  buttonFunction: () {
                    controller.signUp();
                  },
                  buttonName: 'sign up')
            ],
          ));
    });
  }
}
