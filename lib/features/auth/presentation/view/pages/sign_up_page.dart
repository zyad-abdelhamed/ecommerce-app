import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:ecommerce_application/features/auth/presentation/view/components/sign_up_form_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => AuthCubit(sl(), sl()),
        child: Scaffold(
           resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    AuthCubit.goToLogInPage(context);
                  },
                  icon: const Icon(CupertinoIcons.back)),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, //in order to stretch width of app material button
                children: [
                  Text(
                    ViewConstants.signUp,
                    style: TextStyles.textStyle34(context: context),
                  ),
                  const Expanded(child: SizedBoxs.sizedBoxH10),
                  const SignUpFormComponent(),
                  const Expanded(child: SizedBoxs.sizedBoxH10),
                ],
              ),
            )));
  }
}
