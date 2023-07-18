import 'dart:convert';
import 'dart:io';
import 'package:artman_web/config/conststants/api_const.dart';
import 'package:artman_web/features/cart_feature/data/models/order.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../auth_feature/data/models/customer_model.dart';
import '../models/order_detail_model.dart';

class OrderAPiProvider {
  Future<bool> creatOrder(OrderModel model) async {
    //! get current user id from data base
    List<CustomerModel> customerBox = [];
    List<int> keys = [];
    var box = await Hive.openBox<CustomerModel>("customers");
    keys = box.keys.cast<int>().toList();
    for (var key in keys) {
      customerBox.add(box.get(key)!);
    }
    box.close();
    model.customerId = customerBox[0].id;
    bool isOrderCreated = false;
    var authToken = base64.encode(
      utf8.encode("${ApiConstants.key}:${ApiConstants.secret}"),
    );
    String url = "${ApiConstants.baseUrl}${ApiConstants.orderURL}";
    try {
      var response = await Dio().post(url,
          data: model.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Basic $authToken",
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      print(response);
      if (response.statusCode == 201) {
        isOrderCreated = true;
      }
    } on DioException catch (e) {
      print(e.response);
    }
    return isOrderCreated;
  }

  Future<List<OrderModel>> getOrders({String? id}) async {
    List<OrderModel> data = <OrderModel>[];

    try {
      String url =
          "${ApiConstants.baseUrl}${ApiConstants.orderURL}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}&customer=$id";
      print(url);
      var response = await Dio().get(url,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 200) {
        data =
            (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
      }
    } on DioException catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<OrderDetailModel> getOrderDetail(int id) async {
    OrderDetailModel model = OrderDetailModel();

    try {
      String url =
          "${ApiConstants.baseUrl}${ApiConstants.orderURL}/$id?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}";
      var response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      if (response.statusCode == 200) {
        model = OrderDetailModel.fromJson(response.data);
      }
    }on DioException catch (e) {
      print(e);
    } return model ; 
  }

}
