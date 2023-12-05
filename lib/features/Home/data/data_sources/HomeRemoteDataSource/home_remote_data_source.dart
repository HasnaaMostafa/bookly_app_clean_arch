import 'package:bookly_app_clean_arch/core/utils/api_services.dart';
import 'package:bookly_app_clean_arch/core/utils/constants.dart';

import '../../../../../core/utils/function/get_books.dart';
import '../../../../../core/utils/function/saveAsLocal.dart';
import '../../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks(
      {required String category, int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=Computer Science&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBookList(data);
    saveBooksLocal(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?sorting=newest&Filtering=free-ebooks&q=Artificial intelligence&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBookList(data);
    saveBooksLocal(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks(
      {required String category, int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=$category&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBookList(data);

    // saveBooksLocal(books, saveSimilarBooks(category: category));
    return books;
  }

  // List<BookEntity> getBookList(Map<String, dynamic> data) {
  //   List<BookEntity> books = [];
  //   for (var book in data["items"]) {
  //     books.add(BookModel.fromJson(book));
  //   }
  //   return books;
  // }
}
