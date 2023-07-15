import 'package:hive/hive.dart';
part 'image_model.g.dart';
@HiveType(typeId: 3)
class ImageSrc {
    @HiveField(0)
    String?  url;
    ImageSrc({this.url});
    ImageSrc.fromJson(Map<String,dynamic> json){
      url  = json["src"];
    }
  }

