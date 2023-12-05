import 'package:bookly_app_clean_arch/core/errors/failure.dart';
import 'package:bookly_app_clean_arch/features/Home/data/data_sources/HomeLocalDataSource/home_local_data_source.dart';
import 'package:bookly_app_clean_arch/features/Home/data/data_sources/HomeRemoteDataSource/home_remote_data_source.dart';
import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/features/Home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books =
          await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String category, int pageNumber = 0}) async {
    List<BookEntity> books;
    try {
      // books = homeLocalDataSource.fetchSimilarBooks(category: category);
      // if (books.isNotEmpty) {
      //   return right(books);
      // }
      books = await homeRemoteDataSource.fetchSimilarBooks(
          category: category, pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
