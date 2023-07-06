import 'dart:io';

import 'package:artman_web/features/product_list_feature/repository/models/product_model.dart';
import 'package:dio/dio.dart';

import '../../../config/conststants/api_const.dart';

class ProductApiProvider {
  Future<List<ProductModel>> getProducts(
  { 
    int? pageNumber,
    String? pageSize,
    String? strSearch,
    String? tagName,
    String? categoryId,
    String? orderBy,
    String? sortOrder = "asc",//! order type small to larg
  }
    ) async {
    List<ProductModel> data = List<ProductModel>.empty();
    

    try {
    String parameters = "";
    if(strSearch != null){
      parameters+= "&search=$strSearch";
      }
    if(pageSize != null){
      parameters+= "&search=$pageSize";
      }
    if(pageNumber != null){
      parameters+= "&search=$pageNumber";
      }
    if(tagName != null){
      parameters+= "&search=$tagName";
      }
    if(categoryId != null){
      parameters+= "&search=$categoryId";
      }
    if(orderBy != null){
      parameters+= "&search=$orderBy";
      } 
     
      



      String url =
          '${ApiConstants.baseUrl}${ApiConstants.customerUrl}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}${parameters.toString()}';
      var response = await Dio().get(
        url ,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader : "application/json",
          }
        )
      );
      if(response.statusCode == 200){
        data = (response.data as List).map(
          (e) => ProductModel.fromJson(e)
          ).toList();
      }
    } on DioException catch (e) {
      print(e.response);
    }
    return data ;
  }

}
