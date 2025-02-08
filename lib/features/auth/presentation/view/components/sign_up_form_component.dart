import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/widgets/app_sneak_bar.dart';
import 'package:ecommerce_application/core/widgets/app_material_button.dart';
import 'package:ecommerce_application/core/widgets/app_textfield.dart';
import 'package:ecommerce_application/core/extentions/controllers_extention.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormComponent extends StatelessWidget {
  const SignUpFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state.signUpState == RequestStateEnum.success) {
        appSneakBar(
          context: context,
          message: state.signUpmessage,
          isError: false,
        );
      } else if (state.signUpState == RequestStateEnum.failed) {
        appSneakBar(
            context: context, message: state.signUpmessage, isError: true);
      }
    },
        
        builder: (context, state) {
     
      return Form(
          key: context.authController.formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getAppTextfield(
                  appTextFieldInputMdel: AppTextFieldInputMdel(
                      textFieldLabel: 'name'.localization,
                      controller: context.authController.usernameController,
                      context: context)),
              SizedBoxs.sizedBoxH10,
              getAppTextfield(
                  appTextFieldInputMdel: AppTextFieldInputMdel(
                      textFieldLabel: 'phonenumber'.localization,
                      controller: context.authController.phoneNumerController,
                      context: context)),
              SizedBoxs.sizedBoxH10,
              getAppTextfield(
                  appTextFieldInputMdel: AppTextFieldInputMdel(
                      textFieldLabel: 'email'.localization,
                      controller: context.authController.emailController,
                      context: context)),
              SizedBoxs.sizedBoxH10,
              getAppTextfield(
                  appTextFieldInputMdel: AppTextFieldInputMdel(
                      textFieldLabel: 'password'.localization,
                      controller: context.authController.passwordController,
                      context: context)),
              SizedBoxs.sizedBoxH20,
              GestureDetector(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("already_have_an_account".localization),
                   const Icon(Icons.arrow_right_alt)
                  ],
                ),
              ),
              SizedBoxs.sizedBoxH30,
              appMaterialButton(
                  buttonFunction: () {
                    context.authController.signUp();
                  },
                  buttonName: state.logInState == RequestStateEnum.loading
                      ? 'loading'.localization
                      : 'sign_up'.localization),
            ],
          ));
    });
  }
}
