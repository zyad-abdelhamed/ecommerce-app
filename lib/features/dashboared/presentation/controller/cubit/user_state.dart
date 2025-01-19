part of 'user_cubit.dart';

class UserState extends Equatable {
  //get user data use case variables
  final User userData;
  final RequestStateEnum userDataState;
  final String userDataMessage;
  //logout variables
  final RequestStateEnum? logOutState;
  final String? logOutMessage;
  //changepassword variables
  final RequestStateEnum? changePasswordState;
  final String changePasswordMessage;
  //constructor
  const UserState(
      {this.userData =
          const User(email: '', image: '', name: '', phone: '', token: ''),
      this.userDataState = RequestStateEnum.loading,
      this.userDataMessage = '',
      //logout
      this.logOutState,
      this.logOutMessage,
      //changepassword
      this.changePasswordState ,
      this.changePasswordMessage = ''});

  UserState copyWith({
    //get user data use case variables
    User? userData,
    RequestStateEnum? userDataState,
    String? userDataMessage,
    //logout variables
    RequestStateEnum? logOutState,
    String? logOutMessage,
    //changepassword variables
    RequestStateEnum? changePasswordState,
    String? changePasswordMessage,
    //constructor
  }) {
    return UserState(
        changePasswordMessage:
            changePasswordMessage ?? this.changePasswordMessage,
        changePasswordState: changePasswordState ?? this.changePasswordState,
        logOutMessage: logOutMessage ?? this.logOutMessage,
        logOutState: logOutState ?? this.logOutState,
        userData: userData ?? this.userData,
        userDataMessage: userDataMessage ?? this.userDataMessage);
  }

  @override
  List<Object?> get props => [
        userData,
        userDataState,
        userDataMessage,
        logOutState,
        logOutMessage,
        changePasswordMessage,
        changePasswordState
      ];
}
