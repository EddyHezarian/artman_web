import 'package:hive/hive.dart';

import '../../../../core/models/image_model.dart';
part 'category_model.g.dart';

@HiveType(typeId: 4)
class CategoryModel {
  @HiveField(0)
  int? categoryId;
  @HiveField(1)
  String? categoryName;
  @HiveField(2)
  String? categorydescription;
  @HiveField(3)
  int? parent;
  @HiveField(4)
  ImageSrc? image;
  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categorydescription,
    this.parent,
    this.image,
  });
  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json["id"];
    categoryName = json["name"];
    categorydescription = json["description"];
    parent = json["parent"] ?? 0;
    image = json["image"] != null
        ? ImageSrc.fromJson(json["image"])
        : ImageSrc(
            url:
                "https://eddy.dastyar.site/wp-content/uploads/2023/07/Screenshot_2023-07-05_201049-removebg-preview.png");
  }
}
