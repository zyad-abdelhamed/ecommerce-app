import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/log_in.dart';
import 'package:ecommerce_application/features/auth/domain/use_cases/sign_up.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit getAuthController(BuildContext context) {
    final AuthCubit controller = context.read<AuthCubit>();
    return controller;
  }

  final SignUpUseCase signUpUseCase;
  final LogInUseCase logInUseCase;
  AuthCubit(this.signUpUseCase, this.logInUseCase) : super(const AuthState());
  double scale = 1.0;
  Color c = Colors.grey;
  d() {
    scale = 1.5;
    c = Colors.red;
    emit(const AuthState());
  }

  f() {
    scale = 1.0;
    c = Colors.grey;
    // emit(s());
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumerController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //////////////////////
  final TextEditingController logInEmailController = TextEditingController();
  final TextEditingController logInPasswordController = TextEditingController();
  final GlobalKey<FormState> logInFormkey = GlobalKey<FormState>();
  Future<void> signUp() async {
    if (formkey.currentState!.validate()) {
      emit(const AuthState(signUpState: AuthRequestStateEnum.loading));
      final result = await signUpUseCase(SignUpParameters(
          email: emailController.text,
          userName: usernameController.text,
          password: passwordController.text,
          phoneNumber: phoneNumerController.text));
      result.fold(
        (l) => emit(AuthState(
            signUpState: AuthRequestStateEnum.failed,
            signUpmessage: l.message)),
        (r) => emit(const AuthState(
            signUpState: AuthRequestStateEnum.success,
            signUpmessage: ViewConstants.signUpSuccessfully)),
      );
    }
  }

  Future<void> login() async {
    if (logInFormkey.currentState!.validate()) {
      emit(const AuthState(logInState: AuthRequestStateEnum.loading));

      final result = await logInUseCase(LogInParameters(
          email: logInEmailController.text,
          password: logInPasswordController.text));
      result.fold(
          (l) => emit(
                AuthState(
                    logInmessage: l.message,
                    logInState: AuthRequestStateEnum.failed),
              ),
          (r) => emit(const AuthState(
              logInState: AuthRequestStateEnum.success,
              logInmessage: ViewConstants.logInSuccessfully)));
    }
  }

//navigation
  void goToDashboard() {}
  static void goToSignUpPage(BuildContext context) {
    context.pushReplacement('/signup');
  }

  static void goToLogInPage(BuildContext context) {
    context.pushReplacement('/login');
  }
}
