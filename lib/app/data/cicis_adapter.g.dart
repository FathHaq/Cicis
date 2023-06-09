// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cicis_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CicisAdapter extends TypeAdapter<Cicis> {
  @override
  final int typeId = 1;

  @override
  Cicis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cicis(
      title: fields[0] as String,
      category: fields[1] as String,
      nominal: fields[2] as int,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cicis obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.nominal)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CicisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
