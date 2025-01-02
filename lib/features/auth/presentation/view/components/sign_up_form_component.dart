import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/utils/app_sneak_bar.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:ecommerce_application/core/utils/controllers_extention.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.signUpState == AuthRequestStateEnum.success) {
            appSneakBar(context: context, message: state.signUpmessage);
          } else if (state.signUpState == AuthRequestStateEnum.failed) {
            appSneakBar(context: context, message: state.signUpmessage);
          }
        },
        buildWhen: (previous, current) =>
            previous.signUpState != current.signUpState,
        builder: (context, state) {
          print('///////////////////////////////////');
          print(state);
          return state.signUpState == AuthRequestStateEnum.loading
              ? getLoadingWidget()
              : Form(
                  key: context.authController.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      getAppTextfield(
                          textFieldName: 'username',
                          controller: context.authController.usernameController,
                          context: context),
                      SizedBoxs.sizedBoxH10,
                      getAppTextfield(
                          textFieldName: 'phonenumber',
                          controller:
                              context.authController.phoneNumerController,
                          context: context),
                      SizedBoxs.sizedBoxH10,
                      getAppTextfield(
                          textFieldName: 'email',
                          controller: context.authController.emailController,
                          context: context),
                      SizedBoxs.sizedBoxH10,
                      getAppTextfield(
                          textFieldName: 'password',
                          controller: context.authController.passwordController,
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
                            context.authController.signUp();
                          },
                          buttonName: 'sign up')
                    ],
                  ));
        });
  }
}
