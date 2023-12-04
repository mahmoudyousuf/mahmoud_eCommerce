// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationsModelAdapter extends TypeAdapter<NotificationsModel> {
  @override
  final int typeId = 0;

  @override
  NotificationsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationsModel(
      title: fields[0] as String,
      contant: fields[1] as String,
      IsReaded: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.contant)
      ..writeByte(2)
      ..write(obj.IsReaded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
