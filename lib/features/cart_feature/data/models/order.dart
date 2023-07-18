import 'package:artman_web/features/cart_feature/data/models/customer_detail.dart';

class OrderModel {
  int? customerId;
  String? paymentMethod;
  String? paymentMethodTitle;
  bool? setPaid;
  String? transactionId;
  List<LineItemModel>? lineItems;
  int? orderId;
  String? orderNumber;
  String? status;
  DateTime? orderDate;
  Shipping? shipping;

  OrderModel({
    required this.customerId,
    required this.paymentMethod,
    required this.paymentMethodTitle,
    required this.setPaid,
    required this.transactionId,
    required this.lineItems,
    required this.orderId,
    required this.orderNumber,
    required this.status,
    required this.orderDate,
    required this.shipping,
  });
  OrderModel.fromJson(Map<String, dynamic> json) {
    customerId = json["customer_id"];
    orderId = json["id"];
    status = json["status"];
    orderNumber = json["order_key"];
    orderDate = DateTime.parse(json["date_created"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["customer_id"] = customerId;
    data["payment_method"] = paymentMethod;
    data["payment_method_title"] = paymentMethodTitle;
    data["set_paid"] = setPaid;
    data["transaction_id"] = transactionId;
    data["shipping"] = shipping!.toJson();
    if (lineItems != null) {
      data["line_items"] = lineItems!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class LineItemModel {
  int? productId;
  double? total;
  int? qty;
  LineItemModel({
    required this.productId,
    required this.qty,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'qty': qty,
      'total': total,
    };
  }

  LineItemModel.fromJson(Map<String, dynamic> json) {
    productId = json["product_id"];
    qty = json["quantity"];
    total = double.parse(json["total"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["product_id"] = productId;
    data["quantity"] = qty;
    data["total"] = total;
    return data;
  }
}
