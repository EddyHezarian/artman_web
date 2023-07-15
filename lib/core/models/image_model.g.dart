// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageSrcAdapter extends TypeAdapter<ImageSrc> {
  @override
  final int typeId = 3;

  @override
  ImageSrc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageSrc(
      url: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageSrc obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageSrcAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
