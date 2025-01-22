import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/core/services/api_service.dart';
import 'package:ecommerce_application/features/dashboared/data/model/address_model.dart';
import 'package:ecommerce_application/features/dashboared/data/model/user_model.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/add_address_use_case.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/change_password_use_case.dart';

abstract class BaseUserRemoteDataSource {
  Future<UserModel> getUserData();
  Future<Unit> signOut();
  Future<Unit> changePassword(ChangePasswordParameters parameters);
  Future<List<AddressModel>> getAddress();
  Future<Unit> addAddress(AddAddressParameters addAddressParameters);
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSource(this.apiService);
  @override
  Future<UserModel> getUserData() async {
    Map<String, dynamic> responseBody = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.getUserDataEndpoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    return UserModel.formJson(data: responseBody['data']);
  }

  @override
  Future<Unit> signOut() async {
    await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.logOutEndpoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    return Future.value(unit);
  }

  @override
  Future<Unit> changePassword(ChangePasswordParameters parameters) async {
    Map<String, dynamic> responseBody = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.changePasswordEndpoint,
            body: {
              'current_password': parameters.currentPassword,
              'new_password': parameters.newPassword
            },
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    if (responseBody['status'] == false) {
      throw ServerException(message: responseBody['message']);
    } else {
      return unit;
    }
  }

  @override
  Future<Unit> addAddress(AddAddressParameters addAddressParameters) async {
    Map<String, dynamic> responseBody = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.addAddressEndpoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken,
            body: {
          'id': addAddressParameters.id,
          'name': addAddressParameters.name,
          'city': addAddressParameters.city,
          'region': addAddressParameters.region,
          'details': addAddressParameters.details
        }));
    if (responseBody['status'] == false) {
      throw ServerException(message: responseBody['message']);
    } else {
      return unit;
    }
  }

  @override
  Future<List<AddressModel>> getAddress() async {
    Map<String, dynamic> responseBody = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
            url: ApiConstant.getAddressEndpoint,
            apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
    if (responseBody['status'] == true) {
      return List<AddressModel>.from(
          (responseBody['data']['data']).map((e) => AddressModel.fromjson(e)));
    } else {
      throw ServerException(message: responseBody['message']);
    }
  }
}
