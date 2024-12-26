part of 'auth_cubit.dart';

 class AuthState extends Equatable {
  final AuthRequestStateEnum? signUpState;
final String message;
  const AuthState({this.signUpState, this.message = ''});
  
  @override
  List<Object?> get props => [signUpState,message];
}

