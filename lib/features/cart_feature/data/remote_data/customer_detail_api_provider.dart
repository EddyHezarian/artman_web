import 'dart:io';

import 'package:artman_web/config/conststants/api_const.dart';
import 'package:artman_web/features/cart_feature/data/models/customer_detail.dart';
import 'package:dio/dio.dart';

class CustomerDetailApiProvider{
  Future<CustomerDetailModel> getData ()async{
    CustomerDetailModel responseModel= CustomerDetailModel() ;
    try{
      String url = "${ApiConstants.baseUrl}${ApiConstants.customerUrl}/${ApiConstants.useridTMP}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}";

      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader:"application/json",
          }
        )
      );
      if(response.statusCode == 200){responseModel = CustomerDetailModel.fromJson(response.data);}

    }on DioException catch(e){
    print(e.response);
    }
    return responseModel ;
  }
}