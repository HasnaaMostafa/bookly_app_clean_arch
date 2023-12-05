import 'package:bookly_app_clean_arch/core/utils/api_services.dart';
import 'package:bookly_app_clean_arch/core/utils/function/get_books.dart';
import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchBooks(
      {required String searchWord, int pageNumber = 0});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  ApiService apiService;
  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> searchBooks(
      {required String searchWord, int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=$searchWord&startIndex=${pageNumber * 10}");

    List<BookEntity> books = getBookList(data);
    return books;
  }
}
