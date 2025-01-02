import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_sneak_bar.dart';
import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:ecommerce_application/core/utils/controllers_extention.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/loading_widget.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInFormComponent extends StatelessWidget {
  const LogInFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          print(state);
          if (state.logInState == AuthRequestStateEnum.success) {
            appSneakBar(context: context, message: state.logInmessage);

          } else if (state.logInState == AuthRequestStateEnum.failed) {
            appSneakBar(context: context, message: state.logInmessage);
          }
        },
        buildWhen: (previous, current) =>
            previous.logInState != current.logInState,
        builder: (context, state) {

          return state.logInState == AuthRequestStateEnum.loading
              ? getLoadingWidget()
              : Form(
                  key: context.authController.logInFormkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      getAppTextfield(
                          textFieldName: 'email',
                          controller:
                              context.authController.logInEmailController,
                          context: context),
                      SizedBoxs.sizedBoxH10,
                      getAppTextfield(
                          obscure: true,
                          textFieldName: 'password',
                          controller:
                              context.authController.logInPasswordController,
                          context: context),
                      SizedBoxs.sizedBoxH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                AuthCubit.goToSignUpPage(context);
                              },
                              child:
                                  const Text('Do not have any account?Signup'))
                        ],
                      ),
                      SizedBoxs.sizedBoxH30,
                      appMaterialButton(
                          buttonFunction: () {
                            context.authController.login();
                          },
                          buttonName: 'login')
                    ],
                  ));
        });
  }
}
