import 'package:bookly_app_clean_arch/features/search/domain/use_cases/search_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Home/domain/entities/book_entity.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchedBooksUseCase) : super(SearchBooksInitial());

  final SearchedBooksUseCase searchedBooksUseCase;

  Future<void> searchBooks({String? searchWord, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SearchBooksLoading());
    } else {
      emit(SearchBooksLoadingPagination());
    }

    var result = await searchedBooksUseCase.call(searchWord!, pageNumber);

    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SearchBooksError(failure.toString()));
      } else {
        emit(SearchBooksErrorPagination(failure.toString()));
      }
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
