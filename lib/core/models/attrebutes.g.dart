// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attrebutes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttributeAdapter extends TypeAdapter<Attribute> {
  @override
  final int typeId = 5;

  @override
  Attribute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attribute(
      id: fields[0] as int?,
      name: fields[1] as String?,
      options: (fields[2] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Attribute obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.options);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
