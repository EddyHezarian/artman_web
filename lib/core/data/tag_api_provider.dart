import 'dart:io';

import 'package:artman_web/config/conststants/api_const.dart';
import 'package:dio/dio.dart';

import '../models/tag_model.dart';

class TagApiProvider {
  Future<List<TagModel>> getTags() async {
    List<TagModel> tags = <TagModel>[];

    String url =
        '${ApiConstants.baseUrl}${ApiConstants.tagsURL}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}';

    try {
      var response = await Dio().get(url,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }));
      if (response.statusCode == 200) {
        tags =
            (response.data as List).map((e) => TagModel.fromjson(e)).toList();
      }
    } on DioException catch (e) {
      print(e.response);
    }
    return tags;
  }
}
