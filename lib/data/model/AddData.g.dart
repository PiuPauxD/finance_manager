// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddDataAdapter extends TypeAdapter<AddData> {
  @override
  final int typeId = 1;

  @override
  AddData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddData(
      fields[0] as IconData,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AddData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.operationIcon)
      ..writeByte(1)
      ..write(obj.operationName)
      ..writeByte(2)
      ..write(obj.operationDescription)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.IN)
      ..writeByte(5)
      ..write(obj.datetime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
