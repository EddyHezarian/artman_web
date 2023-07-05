import 'dart:convert';
import 'dart:io';

import 'package:artman_web/config/conststants/api_const.dart';
import 'package:artman_web/features/auth_feature/repository/models/customer_model.dart';
import 'package:dio/dio.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

// class CustomerApiProvider {
//   WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
//       url: ApiConstants.baseUrl,
//       consumerKey: ApiConstants.key,
//       consumerSecret: ApiConstants.secret);

//   Future<bool> creatCustomer (CustomerModel model ) async{
//     var authToken = base64.encode(utf8.encode("${ApiConstants.key}:${ApiConstants.secret}"));
//     //* print(authToken);
//     bool flag = false ;
//     //* print(model.toJason() );
//     //* print( "${ApiConstants.baseUrl}${ApiConstants.customerUrl}");
//     try {
//       var response = await Dio().post(
//       ApiConstants.baseUrl + ApiConstants.customerUrl ,
//       data: model.toJason(),
//       options: Options(
//         headers: {
//           HttpHeaders.authorizationHeader : 'Basic $authToken',
//           HttpHeaders.contentTypeHeader : "application/json",
//         }
//       ),
//       );
//       if(response.statusCode == 201){ flag = true ;}
//       if(response.statusCode == 401){ print(response) ;}
//     } catch(e){
//       print(e.toString());
//       flag = false ;
//     }
//     return flag;
//   }
// }



class APIService {
  Future<bool> createCustomer (CustomerModel model) async {
    var authToken = base64.encode(
    utf8.encode("${ApiConstants.key}:${ApiConstants.secret}")
    );
  bool ret = false;
  
  try 
  {
  var response = await Dio().post ('${ApiConstants.baseUrl}${ApiConstants.customerUrl}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}',
  data: model.toJson(),
  options: Options (headers: {
  //HttpHeaders.authorizationHeader: 'Bearer $authToken',
  HttpHeaders.contentTypeHeader: "application/json",
  }));
  if (response.statusCode==201) {
  ret = true;
  }
  }
  on DioException catch (e) {
    print(e.toString());
  if(e.response!.statusCode == 404) {
  ret = false;
  }
  else {
    ret = false ;
  }
  }
  return ret;
  }
  
  }