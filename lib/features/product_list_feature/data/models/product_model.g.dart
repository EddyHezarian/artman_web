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
      name: fields[12] as String?,
      id: fields[0] as int?,
      description: fields[2] as String?,
      shortDescription: fields[3] as String?,
      sku: fields[4] as String?,
      price: fields[5] as String?,
      regularPrice: fields[6] as String?,
      salePrice: fields[7] as String?,
      stockStatus: fields[8] as String?,
      images: (fields[9] as List).cast<Image>(),
      releatedProducts: (fields[1] as List?)?.cast<int>(),
      categories: (fields[10] as List).cast<CategoryModel>(),
      attributes: (fields[11] as List?)?.cast<Attribute>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.releatedProducts)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.shortDescription)
      ..writeByte(4)
      ..write(obj.sku)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.regularPrice)
      ..writeByte(7)
      ..write(obj.salePrice)
      ..writeByte(8)
      ..write(obj.stockStatus)
      ..writeByte(9)
      ..write(obj.images)
      ..writeByte(10)
      ..write(obj.categories)
      ..writeByte(11)
      ..write(obj.attributes)
      ..writeByte(12)
      ..write(obj.name);
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
