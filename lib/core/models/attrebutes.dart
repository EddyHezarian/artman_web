import 'package:hive/hive.dart';
part 'attrebutes.g.dart';
@HiveType(typeId: 5)
class Attribute {
  @HiveField(0)
  int? id ; 
  @HiveField(1)
  String? name ; 
  @HiveField(2)
  List<String>? options ;

  Attribute({this.id , this.name , this.options});

  Attribute.fromJson(Map<String , dynamic>json){
    name = json["name"]; 
    id = json["id"]; 
    options = json["options"].cast <String>() ; 
  }
}