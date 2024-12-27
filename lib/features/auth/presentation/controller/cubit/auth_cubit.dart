import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/sign_up.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;
  AuthCubit(this.signUpUseCase) : super(const AuthState());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumerController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Future<void> sginUp() async {
   if(formkey.currentState!.validate()){
     final result = await signUpUseCase(SignUpParameters(
        email: emailController.text,
        userName: usernameController.text,
        password: passwordController.text,
        phoneNumber: phoneNumerController.text));
    result.fold(
      (l) => emit(AuthState(
          signUpState: AuthRequestStateEnum.failed, message: l.message)),
      (r) => emit(const AuthState(signUpState: AuthRequestStateEnum.success)),
    );
   }
  }

  void goToDashboard() {}
}
