import '../../../../core/models/attrebutes.dart';
import '../../../../core/models/image_model.dart';

import 'package:hive/hive.dart';

import '../../../category_feature/data/model/category_model.dart';
part 'product_model.g.dart';

@HiveType(typeId: 2)
class ProductModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  List<int>? releatedProducts;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? shortDescription;

  @HiveField(5)
  String? sku;

  @HiveField(6)
  String? price;

  @HiveField(7)
  String? regularPrice;

  @HiveField(8)
  String? salePrice;

  @HiveField(9)
  String? stockStatus;

  @HiveField(10)
  late List<ImageSrc> images;

  @HiveField(11)
  late List<CategoryModel> categories;

  @HiveField(12)
  late List<Attribute>? attributes;

  @HiveField(13)
  String? slug;

  ProductModel({
    this.id,
    required this.name,
    this.description,
    this.shortDescription,
    this.sku,
    required this.price,
    this.regularPrice,
    this.salePrice,
    this.stockStatus,
    required this.images,
    this.releatedProducts,
    required this.categories,
    this.attributes,
    this.slug,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
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
    slug = json["slug"];
    if (json["images"] != null) {
      images = <ImageSrc>[];
      json["images"].forEach((element) {
        images.add(ImageSrc.fromJson(element));
      });
    }
    if (json["categories"] != null) {
      categories = <CategoryModel>[];
      json["categories"].forEach((element) {
        categories.add(CategoryModel.fromJson(element));
      });
    }
    if (json["attributes"] != null) {
      attributes = <Attribute>[];
      json["attributes"].forEach((element) {
        attributes!.add(Attribute.fromJson(element));
      });
    }
  }
}
