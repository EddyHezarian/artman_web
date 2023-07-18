import 'package:artman_web/features/cart_feature/data/models/customer_detail.dart';
import 'package:artman_web/features/cart_feature/data/models/order.dart';
class OrderDetailModel {
  int? orderid;
  String? ordernumber;
  String? paymentmethod;
  String? orderStatus;
  DateTime? orderDate;
  Shipping? shipping;
  List<LineItemModel>? lineItems;
  double? totalAmount;
  double? shippingTotal;
  double? itemTotalAmount;
  OrderDetailModel({
    this.orderid,
    this.ordernumber,
    this.paymentmethod,
    this.orderStatus,
    this.orderDate,
    this.shipping,
    this.lineItems,
    this.totalAmount,
    this.shippingTotal,
    this.itemTotalAmount,
  });
  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    orderid = json["id"];
    ordernumber = json["order_key"];
    paymentmethod = json["payment_method_title"];
    orderStatus = json["status"];
    orderDate = DateTime.parse(json["date_created"]);
    shipping =
        json["shipping"] != null ? Shipping.fromJson(json["shipping"]) : null;
    if (json["line_items"] != null) {
      lineItems = <LineItemModel>[];
      json["line_items"].forEach((element) {
        lineItems!.add(LineItemModel.fromJson(element));
      });
    }
    itemTotalAmount=lineItems!= null ? lineItems!.map<double>((e) => e.total!).reduce((value, element) => value+element):0 ;
    totalAmount = double.parse(json["total"]);
    shippingTotal = double.parse(json["shipping_total"]);
  }
}
