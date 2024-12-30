import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/log_in.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/sign_up.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;
  final LogInUseCase logInUseCase;
  AuthCubit(this.signUpUseCase, this.logInUseCase) : super(const AuthState());
  double scale = 1.0;
  Color c = Colors.grey;
  d() {
    scale = 1.5;
    c = Colors.red;
    emit(AuthState());
  }

  f() {
    scale = 1.0;
    c = Colors.grey;
    emit(s());
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumerController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Future<void> signUp() async {
    if (formkey.currentState!.validate()) {
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
  final TextEditingController logInEmailController = TextEditingController();
  final TextEditingController logInPasswordController = TextEditingController();
  final GlobalKey<FormState> logInFormkey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(Loading());
    if (logInFormkey.currentState!.validate()) {
      final result = await logInUseCase(LogInParameters(
          email: logInEmailController.text,
          password: logInPasswordController.text));
      result.fold(
          (l) => emit(
                state.copyWith(
                    logInmessage: l.message,
                    logInState: AuthRequestStateEnum.failed),
              ),
          (r) =>
              emit(state.copyWith(logInState: AuthRequestStateEnum.success)));
    }
  }
}
