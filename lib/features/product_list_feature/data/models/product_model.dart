import '../../../category_feature/repository/model/category_model.dart';
class ProductModel { 
  int? id  ;
  List<int>? releatedProducts ;
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
  late List<Attribute>? attributes;

  
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
    this.releatedProducts,
    required this.categories ,
    this.attributes,
  });

  ProductModel.fromJson(Map<String, dynamic>json){
    id = json["id"];
    name = json["name"];
    description = json["description"];
    shortDescription = json["short_description"];
    sku = json["sku"];
    price = json["price"];
    regularPrice = json["regular_price"];
    releatedProducts = json["upsell_ids"].cast<int>();
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
    if(json["attributes"] != null){
      attributes = <Attribute>[];
      json["attributes"].forEach((element){attributes!.add(Attribute.fromJson(element));});
    }
    
    



  }





}

class Attribute {
  int? id ; 
  String? name ; 
  List<String>? options ;
  Attribute({this.id , this.name , this.options});

  Attribute.fromJson(Map<String , dynamic>json){
    name = json["name"]; 
    id = json["id"]; 
    options = json["options"].cast <String>() ; 
  }


}