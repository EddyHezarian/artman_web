// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 2;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int?,
      name: fields[2] as String?,
      description: fields[3] as String?,
      shortDescription: fields[4] as String?,
      sku: fields[5] as String?,
      price: fields[6] as String?,
      regularPrice: fields[7] as String?,
      salePrice: fields[8] as String?,
      slug: fields[13] as String?,
      stockStatus: fields[9] as String?,
      images: (fields[10] as List).cast<ImageSrc>(),
      releatedProducts: (fields[1] as List?)?.cast<int>(),
      categories: (fields[11] as List).cast<CategoryModel>(),
      attributes: (fields[12] as List?)?.cast<Attribute>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.releatedProducts)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.shortDescription)
      ..writeByte(5)
      ..write(obj.sku)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.regularPrice)
      ..writeByte(8)
      ..write(obj.salePrice)
      ..writeByte(9)
      ..write(obj.stockStatus)
      ..writeByte(10)
      ..write(obj.images)
      ..writeByte(11)
      ..write(obj.categories)
      ..writeByte(12)
      ..write(obj.attributes)
      ..writeByte(13)
      ..write(obj.attributes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
