// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localProductModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalProductModelAdapter extends TypeAdapter<LocalProductModel> {
  @override
  final int typeId = 1;

  @override
  LocalProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalProductModel(
      productName: fields[0] as String,
      productPrice: fields[1] as String,
      productTotalPrice: fields[2] as double,
      productCount: fields[3] as int,
      productImage: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalProductModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.productPrice)
      ..writeByte(2)
      ..write(obj.productTotalPrice)
      ..writeByte(3)
      ..write(obj.productCount)
      ..writeByte(4)
      ..write(obj.productImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
