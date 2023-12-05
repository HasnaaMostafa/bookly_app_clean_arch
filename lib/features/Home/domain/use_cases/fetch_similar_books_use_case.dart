import 'package:bookly_app_clean_arch/features/Home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/book_entity.dart';

class FetchSimilarBooksUseCase
    extends UseCaseWith2Param<List<BookEntity>, String, int> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [String? param, int param2 = 0]) async {
    return await homeRepo.fetchSimilarBooks(
        category: param!, pageNumber: param2);
  }
}
