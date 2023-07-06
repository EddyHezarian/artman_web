
import 'dart:io';

import 'package:artman_web/features/category_feature/repository/model/category_model.dart';
import 'package:dio/dio.dart';

import '../../../config/conststants/api_const.dart';

class CategoryApiProvider{
  Future<List<CategoryModel>> getCategories()async {
    List<CategoryModel> data = List.empty();
    try {
      String url = '${ApiConstants.baseUrl}${ApiConstants.category}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}';
      var response = await Dio().get(url , 
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader : 'application/json',
        }
      )
      ) ;
      if (response.statusCode == 200){
        data = (response.data as List).map(
          (e) => CategoryModel.fromJason(e)
          ).toList();
      }
    }on DioException catch (e) {
      print(e.response);
    }
    return data ;
  }
}