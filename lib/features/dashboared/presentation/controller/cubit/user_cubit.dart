import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constants/cache_constants.dart';
import 'package:ecommerce_application/core/errors/failures.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/services/cache_service.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/user.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/change_password_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/get_user_data_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/logout_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserDataUseCase getUserDataUseCase;
  final LogoutUseCase logoutUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  GlobalKey<FormState> passwordChangeKey = GlobalKey<FormState>();
  UserCubit(
      this.getUserDataUseCase, this.logoutUseCase, this.changePasswordUseCase)
      : super(const UserState());

  void getUserData() async {
    Either<Failure, User> result = await getUserDataUseCase();
    result.fold(
      (failure) => emit(UserState(
          userDataState: RequestStateEnum.failed,
          userDataMessage: failure.message)),
      (userData) => emit(UserState(
          userData: userData, userDataState: RequestStateEnum.success)),
    );
  }

  void signOut({required BuildContext context}) async {
    Either<Failure, Unit> result = await logoutUseCase();
    result.fold(
        (failure) => emit(UserState(
            logOutState: RequestStateEnum.failed,
            logOutMessage: failure.message)), (success) async{
      context.pushReplacement('/login');
     await sl<BaseCache>().deletecache(key: CacheConstants.userDataKey);
     await sl<BaseCache>().deletecache(key: CacheConstants.tokenKey);
    });
  }

  void changePassword({required ChangePasswordParameters parameters}) async {
    emit(const UserState(changePasswordState: RequestStateEnum.loading));
    Either<Failure, Unit> result =
        await changePasswordUseCase(parameters: parameters);
    result.fold(
        (l) => emit(state.copyWith(
            changePasswordMessage: l.message,
            changePasswordState: RequestStateEnum.failed)),
        (r) => emit(
            state.copyWith(changePasswordState: RequestStateEnum.success)));
  }
}
