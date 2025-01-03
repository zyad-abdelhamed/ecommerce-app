import 'dart:convert';

import 'package:ecommerce_application/core/constants/api_constant.dart';
import 'package:ecommerce_application/core/errors/exceptions.dart';
import 'package:ecommerce_application/features/dashboared/data/model/banner_model.dart';
import 'package:http/http.dart' as http;

abstract class DashboardRemoteDataSource {
  Future<List<BannerModel>> getDataBanner();
}

class RemoteDataSourceImpl extends DashboardRemoteDataSource {
  @override
  Future<List<BannerModel>> getDataBanner() async {
    var response = await http.get(Uri.parse(ApiConstant.getBannerEndPoint));
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      return List<BannerModel>.from(
          (responseBody['data'] as List).map((e) => BannerModel.fromJson(e)));
    } else {
      throw const ServerException(message: 'NO Data');
    }
  }
}
