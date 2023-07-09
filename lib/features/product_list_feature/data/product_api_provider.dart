import 'dart:io';

import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../config/conststants/api_const.dart';

class ProductApiProvider {
  
  Future<List<ProductModel>> getProducts(
  { 
    int? pageNumber,
    List<int>? relatedIDS,
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
      parameters+= "&per_page=$pageSize";
      }
    if(pageNumber != null){
      parameters+= "&page=$pageNumber";
      }
    if(tagName != null){
      parameters+= "&tag=$tagName";
      }
    if(relatedIDS != null){
      parameters+= "&include=${relatedIDS.join(",").toString()}";
      }
    if(categoryId != null){
      parameters+= "&category=$categoryId";
      }
    if(orderBy != null){
      parameters+= "&orderBy=$orderBy";
      }
      if(sortOrder != null){
      parameters+= "&order=$sortOrder";
      }
      String url =
          '${ApiConstants.baseUrl}${ApiConstants.products}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}${parameters.toString()}';
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

