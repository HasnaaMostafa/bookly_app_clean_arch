import 'package:bookly_app_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0});

  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String category, int pageNumber = 0});
}
