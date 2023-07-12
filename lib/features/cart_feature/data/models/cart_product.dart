import 'package:hive/hive.dart';
part 'cart_product.g.dart';

@HiveType(typeId: 1)
class CartProductModel {
  @HiveField(0)
  String name ; 
  @HiveField(1)
  int productId;
  @HiveField(2)
  int qty ; 
  @HiveField(3)
  String img ;   
  @HiveField(4)
  String price ; 
//! constructor
CartProductModel({
    required this.name,
    required this.productId,
    required this.qty,
    required this.img,
    required this.price,

  });
//! to map 
Map<String, dynamic> toMap() {
    return {
      'name': name,
      'productId': productId,
      'qty': qty,
      'img': img,
      'price': price,
    };
  }

//! from json 


  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      name: json['name'],
      productId: json['productId'],
      qty: json['qty'],
      img: json['img'] ,
      price: json['price'] ,
    );
  }
}