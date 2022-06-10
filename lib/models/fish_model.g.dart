// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FishModelAdapter extends TypeAdapter<FishModel> {
  @override
  final int typeId = 0;

  @override
  FishModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FishModel(
      name: fields[0] as String?,
      deadReason: fields[1] as String?,
      mummy: fields[2] as String?,
      daddy: fields[3] as String?,
      lifeTime: fields[4] as int?,
      countChoose: fields[5] as int?,
      birthday: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, FishModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.deadReason)
      ..writeByte(2)
      ..write(obj.mummy)
      ..writeByte(3)
      ..write(obj.daddy)
      ..writeByte(4)
      ..write(obj.lifeTime)
      ..writeByte(5)
      ..write(obj.countChoose)
      ..writeByte(6)
      ..write(obj.birthday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FishModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
