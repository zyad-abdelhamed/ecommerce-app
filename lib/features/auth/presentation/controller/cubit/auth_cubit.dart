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
  AuthCubit(
    this.signUpUseCase,
    this.logInUseCase,
  ) : super(const AuthState());

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
      emit(const AuthState(signUpState: RequestStateEnum.loading));
      final result = await signUpUseCase(
          parameters: SignUpParameters(
              email: emailController.text,
              userName: usernameController.text,
              password: passwordController.text,
              phoneNumber: phoneNumerController.text));
      result.fold(
        (l) => emit(AuthState(
            signUpState: RequestStateEnum.failed, signUpmessage: l.message)),
        (r) => emit(const AuthState(
            signUpState: RequestStateEnum.success,
            signUpmessage: ViewConstants.signUpSuccessfully)),
      );
    }
  }

  Future<void> login() async {
    if (logInFormkey.currentState!.validate()) {
      emit(const AuthState(logInState: RequestStateEnum.loading));

      final result = await logInUseCase(
          parameters: LogInParameters(
              email: logInEmailController.text,
              password: logInPasswordController.text));
      result.fold(
          (l) => emit(
                AuthState(
                    logInmessage: l.message,
                    logInState: RequestStateEnum.failed),
              ), (r) {
        // emit(const AuthState(
        //     logInState: RequestStateEnum.success,
        //     logInmessage: ViewConstants.logInSuccessfully));
        // goToDashboard(context);
      });
    }
  }

//navigation
  void goToDashboard(BuildContext context) {
    context.pushReplacement('/dashboard');
  }

  static void goToSignUpPage(BuildContext context) {
    context.pushReplacement('/signup');
  }

  static void goToLogInPage(BuildContext context) {
    context.pushReplacement('/login');
  }
}
