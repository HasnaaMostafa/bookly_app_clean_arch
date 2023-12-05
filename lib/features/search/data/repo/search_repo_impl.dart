import 'package:bookly_app_clean_arch/core/errors/failure.dart';
import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/features/search/data/data_sources/SearchRemoteDataSource/search_remote_data_source.dart';
import 'package:bookly_app_clean_arch/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks(
      {required String searchWord, int pageNumber = 0}) async {
    List<BookEntity> books;
    try {
      books = await searchRemoteDataSource.searchBooks(
          searchWord: searchWord, pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
