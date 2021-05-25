// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryItems.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryItemAdapter extends TypeAdapter<CategoryItem> {
  @override
  final typeId = 1;
  @override
  CategoryItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryItem(
      transactionType: fields[0] as String,
      categoryName: fields[1] as String,
      amount: fields[2] as double,
      quantity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.transactionType)
      ..writeByte(1)
      ..write(obj.categoryName)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.quantity);
  }
}
