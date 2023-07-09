import '../../../category_feature/repository/model/category_model.dart';
class ProductModel { 
  int? id  ; 
  String?  name ; 
  String?  description; 
  String?  shortDescription ; 
  String?  sku ; 
  String?  price ; 
  String?  regularPrice ; 
  String?  salePrice ; 
  String?  stockStatus ; 
  late List<Image> images ; 
  late List<CategoryModel> categories;
  
  ProductModel({
    this.id ,
    required this.name ,
    this.description ,
    this.shortDescription ,
    this.sku ,
    required this.price ,
    this.regularPrice ,
    this.salePrice ,
    this.stockStatus ,
    required this.images ,
    required this.categories ,
  });

  ProductModel.fromJson(Map<String, dynamic>json){
    id = json["id"];
    name = json["name"];
    description = json["description"];
    shortDescription = json["short_description"];
    sku = json["sku"];
    price = json["price"];
    regularPrice = json["regular_price"];
    salePrice = json["sale_price"];
    stockStatus = json["stock_status"];
    if(json["images"] != null){
      images = <Image>[];
      json["images"].forEach((element){ images.add( Image.fromJson(element));} );
      }
      if(json["categories"] != null){
      categories = <CategoryModel>[];
      json["categories"].forEach((element){ categories.add( CategoryModel.fromJason(element));} );
      }
  }





}