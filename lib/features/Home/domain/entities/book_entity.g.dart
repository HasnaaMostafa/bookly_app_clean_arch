// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      image: fields[0] as String?,
      bookId: fields[5] as String,
      title: fields[1] as String,
      authorName: fields[2] as String?,
      price: fields[3] as num?,
      rating: fields[4] as num?,
      categories: fields[7] as String?,
      link: fields[8] as String?,
      ratingCount: fields[6] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.authorName)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.bookId)
      ..writeByte(6)
      ..write(obj.ratingCount)
      ..writeByte(7)
      ..write(obj.categories)
      ..writeByte(8)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
