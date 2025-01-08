import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/services/navigation.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_sneak_bar.dart';
import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:ecommerce_application/core/utils/controllers_extention.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogInFormComponent extends StatelessWidget {
  const LogInFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          
          print(state);
          print("${ApiConstant.token}==========================");
          if (state.logInState == RequestStateEnum.success) {
            appSneakBar(context: context, message: state.logInmessage, isError: false);
            context.pushReplacement('/dashboard');
          } else if (state.logInState == RequestStateEnum.failed) {
            appSneakBar(context: context, message: state.logInmessage, isError: true);
          }
        },
        buildWhen: (previous, current) =>
            previous.logInState != current.logInState,
        builder: (context, state) {

          return Form(
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
                          buttonName:state.logInState == RequestStateEnum.loading? 'loading...' : 'login')
                    ],
                  ));
        });
  }
}
