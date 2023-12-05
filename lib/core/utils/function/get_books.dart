import '../../../features/Home/domain/entities/book_entity.dart';
import '../../models/BookModel.dart';

List<BookEntity> getBookList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var book in data["items"]) {
    books.add(BookModel.fromJson(book));
  }
  return books;
}
