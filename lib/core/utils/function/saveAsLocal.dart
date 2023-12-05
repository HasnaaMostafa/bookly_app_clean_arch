import 'package:hive/hive.dart';

import '../../../features/Home/domain/entities/book_entity.dart';

void saveBooksLocal(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
