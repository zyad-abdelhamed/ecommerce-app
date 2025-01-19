import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/dashboared/data/model/user_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/change_password_use_case.dart';

abstract class BaseUserRemoteDataSource {
  Future<UserModel> getUserData();
  Future<Unit> signOut();
  Future<Unit> changePassword(ChangePasswordParameters parameters);
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSource(this.apiService);
  @override
  Future<UserModel> getUserData() async {
    Map<String, dynamic> responseBody = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.getUserDataEndpoint,
            headers: {'Authorization': ApiConstant.token}));
    return UserModel.formJson(data: responseBody['data']);
  }

  @override
  Future<Unit> signOut() async {
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.logOutEndpoint,
            headers: {'Authorization': ApiConstant.token}));
    return Future.value(unit);
  }

  @override
  Future<Unit> changePassword(ChangePasswordParameters parameters) async {
    Map<String, dynamic> responseBody = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.changePasswordEndpoint,
            headers: {
          'Authorization': ApiConstant.token
        },
            body: {
          'current_password': parameters.currentPassword,
          'new_password': parameters.newPassword
        }));
    if (responseBody['status'] == false) {
      throw ServerException(message: responseBody['message']);
    } else {
      return unit;
    }
  }
}
