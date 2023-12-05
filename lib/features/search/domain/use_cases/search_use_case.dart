import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../Home/domain/entities/book_entity.dart';
import '../repo/search_repo.dart';

class SearchedBooksUseCase
    extends UseCaseWith2Param<List<BookEntity>, String, int> {
  final SearchRepo searchRepo;

  SearchedBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [String? param, int param2 = 0]) async {
    return await searchRepo.searchBooks(searchWord: param!, pageNumber: param2);
  }
}
