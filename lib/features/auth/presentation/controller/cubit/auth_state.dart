part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final RequestStateEnum? signUpState;
  final String signUpmessage;
  final RequestStateEnum? logInState;
  final String logInmessage;
  const AuthState(
      {this.logInState,
      this.logInmessage = '',
      this.signUpState,
      this.signUpmessage = ''});

  @override
  List<Object?> get props => [signUpState, signUpmessage, logInmessage, logInState];
}
