import 'package:hive_flutter/adapters.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? authorName;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final String bookId;
  @HiveField(6)
  final num? ratingCount;
  @HiveField(7)
  final String? categories;
  @HiveField(8)
  final String? link;

  BookEntity({
    required this.image,
    required this.bookId,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.categories,
    required this.link,
    required this.ratingCount,
  });
}
