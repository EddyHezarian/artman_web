import "package:hive/hive.dart";
part 'tag_model.g.dart';

@HiveType(typeId: 7)
class TagModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;

  TagModel({this.id, this.title});

  TagModel.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["name"];
  }
}
