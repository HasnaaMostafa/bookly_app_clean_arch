import 'package:bookly_app_clean_arch/features/Home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);

    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksError(failure.toString()));
      } else {
        emit(FeaturedBooksPaginationError(failure.toString()));
      }
    }, (books) => {emit(FeaturedBooksSuccess(books))});
  }
}
