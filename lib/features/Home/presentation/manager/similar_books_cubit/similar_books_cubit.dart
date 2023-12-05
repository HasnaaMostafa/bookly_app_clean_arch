import 'package:bookly_app_clean_arch/features/Home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({String? category, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksLoadingPagination());
    }
    var result = await fetchSimilarBooksUseCase.call(category!, pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SimilarBooksError(failure.toString()));
      } else {
        emit(SimilarBooksErrorPagination(failure.toString()));
      }
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
