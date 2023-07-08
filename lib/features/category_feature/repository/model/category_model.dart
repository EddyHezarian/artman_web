import 'dart:ffi';

class Image {
    String?  url; 
    Image({this.url});

    Image.fromJson(Map<String,dynamic> json){
      url  = json["src"];
    }
  }


class CategoryModel{
  int? categoryId ; 
  String? categoryName ; 
  String? categorydescription ; 
  Int? parent; 
  Image? image ; 
  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categorydescription,
    this.parent,
    this.image,
  });
  CategoryModel.fromJason(Map<String , dynamic > json){
    categoryId = json["id"];
    categoryName = json["name"];
    categorydescription = json["description"];
    parent = json["parent"];
    image = json["image"]  != null ? Image.fromJson(json["images"]) : null ;
  }
}
