// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remainder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RemainderModelAdapter extends TypeAdapter<RemainderModel> {
  @override
  final int typeId = 1;

  @override
  RemainderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RemainderModel(
      id: fields[0] as int?,
      reminder: fields[1] as String?,
      reminderType: fields[2] as String?,
      date: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RemainderModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.reminder)
      ..writeByte(2)
      ..write(obj.reminderType)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemainderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
