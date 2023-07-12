
import 'dart:convert';
import 'dart:io';

import 'package:artman_web/config/conststants/api_const.dart';
import 'package:artman_web/features/cart_feature/data/models/order.dart';
import 'package:dio/dio.dart';

class OrderAPiProvider {

  Future<bool>creatOrder (OrderModel model)async{
    model.customerId = int.parse(ApiConstants.useridTMP);
    bool isOrderCreated = false ; 
    var authToken = base64.encode(
      utf8.encode("${ApiConstants.key}:${ApiConstants.secret}"),
    );
    String url = "${ApiConstants.baseUrl}${ApiConstants.orderURL}";

    try{
      var response = await Dio().post(
        url , 
        data: model.toJson(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader : "Basic $authToken",
            HttpHeaders.contentTypeHeader: "application/json",
          }
        )
      );
      print(response);
      if (response.statusCode == 201){
        isOrderCreated = true ; 
      }
    }on DioException catch(e){
      print(e.response); 
    }
    return isOrderCreated; 
  }
}