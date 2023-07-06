
import 'dart:io';
import 'package:artman_web/config/conststants/api_const.dart';
import 'package:artman_web/features/auth_feature/repository/models/customer_model.dart';
import 'package:artman_web/features/auth_feature/repository/models/login_response_model.dart';
import 'package:dio/dio.dart';


class CustomerApiProvider {
  Future<bool> createCustomer(CustomerModel model) async {
    //access to auth token not needed for sign up !
    // var authToken = base64.encode(
    // utf8.encode("${ApiConstants.key}:${ApiConstants.secret}")
    // );

    bool ret = false;
    try {
      var response = await Dio().post(
          '${ApiConstants.baseUrl}${ApiConstants.customerUrl}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}',
          data: model.toJson(),
          options: Options(headers: {
            //HttpHeaders.authorizationHeader: 'Bearer $authToken',
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioException catch (e) {
      // print(e.toString());
      if (e.response!.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<LoginResponseModel> loginCustomer(
    String username,
    String password,
  ) async {
    LoginResponseModel model = LoginResponseModel();

    try {
      var response = await Dio().post(ApiConstants.token,
          data: {
            "username": username,
            "password": password,
          },
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
          }));
      if (response.statusCode == 200) {
        model = LoginResponseModel.fromJason(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
    return model;
  }
}
