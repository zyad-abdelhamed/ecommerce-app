part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final AuthRequestStateEnum? signUpState;
  final String message;
  final AuthRequestStateEnum? logInState;
  final String logInmessage;
  const AuthState(
      {this.logInState ,
      this.logInmessage = '',
      this.signUpState,
      this.message = ''});
  AuthState copyWith({
    AuthRequestStateEnum? signUpState,
    String? message,
    AuthRequestStateEnum? logInState,
    String? logInmessage,
  }) {
    return AuthState(
        logInState: logInState ?? this.logInState,
        logInmessage: logInmessage ?? this.logInmessage,
        message: message ?? this.message,
        signUpState: signUpState ?? this.signUpState);
  }

  @override
  List<Object?> get props => [signUpState, message, logInmessage, logInState];
}

class s extends AuthState {}

class Loading extends AuthState {}
