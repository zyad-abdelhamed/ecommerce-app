part of 'user_cubit.dart';

class UserState extends Equatable {
  //get user data use case variables
  final User userData;
  final RequestStateEnum userDataState;
  final String userDataMessage;
  //logout variables
  final RequestStateEnum? logOutState;
  final String? logOutMessage;
  //constructor
  const UserState(
      {this.userData =
          const User(email: '', image: '', name: '', phone: '', token: ''),
      this.userDataState = RequestStateEnum.loading,
      this.userDataMessage = '',
      //logout
      this.logOutState,
      this.logOutMessage});

  @override
  List<Object?> get props =>
      [userData, userDataState, userDataMessage, logOutState, logOutMessage];
}
