
import 'dart:io';
import 'package:artman_web/config/conststants/api_const.dart';
import 'package:artman_web/features/auth_feature/repository/models/customer_model.dart';
import 'package:artman_web/features/auth_feature/repository/models/login_response_model.dart';
import 'package:dio/dio.dart';


class CustomerApiProvider {
  Future<bool> createCustomer(CustomerModel model) async {
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

  Future<bool> searchForCustomerByEmail({ String? email })async {
    bool isExistUser = true ;
    List<CustomerModel> data = List.empty();
    try {
      String url = '${ApiConstants.baseUrl}${ApiConstants.customerUrl}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}&email=$email';
      var response = await Dio().get(url , 
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader : 'application/json',
        }
      )
      ) ;

      
      if (response.statusCode == 200){
        data = (response.data as List).map(
          (e) => CustomerModel.fromJason(e)
          ).toList();
        data.isEmpty ?  isExistUser = false  : isExistUser = true ; 
      }
    }on DioException catch (e) {
      print(e.response);
    }
  return isExistUser;
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
        print("pass");
        model = LoginResponseModel.fromJason(response.data);
      }
    } on DioException catch (e) {
      print(e.response);
      print("---------------------------------------------------");
    }
    return model;
  }
}
