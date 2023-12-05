import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../Home/domain/entities/book_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> searchBooks(
      {required String searchWord, int pageNumber = 0});
}
