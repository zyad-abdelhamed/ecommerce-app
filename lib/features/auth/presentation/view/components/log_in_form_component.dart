import 'package:ecommerce_application/core/constants/variable_constant.dart';
import 'package:ecommerce_application/core/utils/app_material_button.dart';
import 'package:ecommerce_application/core/utils/app_textfield.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:ecommerce_application/features/auth/presentation/view/pages/sign_up_page.dart';
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
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('log in successfully'),
                );
              },
            );

            print(VariableConstant.token);
          } else if (state.logInState == AuthRequestStateEnum.failed) {
            showDialog(
              context: context,
              builder: (context) {
                return  AlertDialog(
                  content: Text(state.logInmessage),
                );
              },
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.logInState != current.logInState,
        builder: (context, state) {
          print(VariableConstant.token);
          final controller = context.read<AuthCubit>();

          return Form(
              key: controller.logInFormkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  getAppTextfield(
                      textFieldName: 'email',
                      controller: controller.logInEmailController,
                      context: context),
                  SizedBoxs.sizedBoxH10,
                  getAppTextfield(obscure: true,
                      textFieldName: 'password',
                      controller: controller.logInPasswordController,
                      context: context),
                  SizedBoxs.sizedBoxH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ));
                          },
                          child: const Text('Do not have any account?Signup'))
                    ],
                  ),
                  SizedBoxs.sizedBoxH30,
                  appMaterialButton(
                      buttonFunction: () {
                        controller.login();
                      },
                      buttonName:state is Loading?'loading.....': 'login')
                ],
              ));
        });
  }
}
