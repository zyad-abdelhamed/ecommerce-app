import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/app_bottom_navigation_bar.dart';
import 'package:ecommerce_application/core/utils/controllers_extention.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:ecommerce_application/features/auth/presentation/view/components/sign_up_form_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AuthCubit.goToLogInPage(context);
              },
              icon: const Icon(CupertinoIcons.back)),
        ),
        bottomNavigationBar: appBottomNavigationBar(context),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                ViewConstants.signUp,
                style: TextStyles.textStyle34,
              ),
              SignUpFormComponent()
            ],
          ),
        ));
  }
}
